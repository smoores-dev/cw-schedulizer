namespace :db do
  desc "Create exec users"
  task populate: :environment do
    Employee.create!(name: "Shane Moore",
                     netID: "swm85",
                     password: "password",
                     password_confirmation: "password",
                     exec: true)
    Employee.create!(name: "Eric Silverberg",
                     netID: "ews56",
                     password: "password",
                     password_confirmation: "password",
                     exec: true)
    Employee.create!(name: "Sarah Reitman",
                     netID: "snr37",
                     password: "password",
                     password_confirmation: "password",
                     exec: true)
    Employee.create!(name: "Noah Liff",
                     netID: "njl39",
                     password: "password",
                     password_confirmation: "password",
                     exec: true)
    Employee.create!(name: "Michael Ostro",
                     netID: "mjo92",
                     password: "password",
                     password_confirmation: "password",
                     exec: true)
    Employee.create!(name: "Michael Riyad",
                     netID: "mgr54",
                     password: "password",
                     password_confirmation: "password",
                     exec: true)
    Employee.create!(name: "Hannah James",
                     netID: "hoj4",
                     password: "password",
                     password_confirmation: "password",
                     exec: true)
    Employee.create!(name: "Kendall Stokes",
                     netID: "kas425",
                     password: "password",
                     password_confirmation: "password",
                     exec: true)
  end
end