FactoryGirl.define do
  factory :user do
    username              "example"
    email                 "example@me.com"
    password              "password"
    password_confirmation "password"
    height_feet           6
    height_inches         2
    weight                180
    level                 "intermdeiate"
    goal                  "lose weight"
  end
end