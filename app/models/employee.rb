class Employee < ActiveRecord::Base
  has_secure_password
  before_save { netID.downcase! }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  validates :netID, presence: true, uniqueness: { case_sensative: false }
  validates :password, length: { minimum: 6 }

  def Employee.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Employee.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = Employee.encrypt(Employee.new_remember_token)
    end
end
