# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news_story, :class => 'NewsStories' do
    title "MyString"
    snippet "MyString"
    url "MyString"
  end
end
