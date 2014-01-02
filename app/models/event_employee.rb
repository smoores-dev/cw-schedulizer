class EventEmployee < ActiveRecord::Base
  belongs_to :event
  belongs_to :employee
  validates :event_id, presence: true
  validates :employee_id, presence: true
end
