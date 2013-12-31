# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    name "MyString"
    netID "MyString"
    password "MyString"
    password_confirmation "MyString"
  end
end
