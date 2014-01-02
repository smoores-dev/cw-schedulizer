class Event < ActiveRecord::Base
  has_many :event_employees, foreign_key: "event_id", dependent: :destroy
  has_many :workers, through: :event_employees, source: :employee
  default_scope -> { order('date DESC') }
  validates :place, presence: true, length: { maximum: 100 }
  validates :date, presence: true
  validates :start, presence: true
end
