namespace :db do
  desc "Create test link"
  task make_test: :environment do
    Test.create!(link: "http://google.com", testingPeriod: true)
  end
end