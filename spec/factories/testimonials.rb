# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :testimonial, :class => 'Testimonials' do
    content "MyString"
    author "MyString"
  end
end
