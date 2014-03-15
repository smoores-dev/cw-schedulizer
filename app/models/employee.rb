class Employee < ActiveRecord::Base
  has_many :event_employees, foreign_key: "employee_id", dependent: :destroy
  has_many :events, through: :event_employees, source: :event
  has_secure_password
  before_save { netID.downcase! }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  validates :netID, presence: true, uniqueness: { case_sensative: false }
  validates :password, length: { minimum: 6 }

  default_scope order: 'employees.name ASC'

  def Employee.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Employee.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def signed_up?(event)
    event_employees.find_by(event_id: event.id)
  end

  def signup!(event)
    event_employees.create!(event_id: event.id)
  end

  def cancel!(event)
    event_employees.find_by(event_id: event.id).destroy!
  end

  private

    def create_remember_token
      self.remember_token = Employee.encrypt(Employee.new_remember_token)
    end
end
