class Testimonial < ActiveRecord::Base
  validates :content, :author, presence: true
end
