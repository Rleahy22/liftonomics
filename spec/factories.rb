FactoryGirl.define do
  factory :user do
    username              "example"
    email                 "example@me.com"
    password              "password"
    password_confirmation "password"
    height_feet           6
    height_inches         2
    weight                180
    max_bench             200
    max_squat             300
    max_deadlift          400
    level                 "Intermediate"
    goal                  "Lose Weight"
  end

  factory :workout do
    name "split"
  end
end