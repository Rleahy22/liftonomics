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

  factory :week do
    week_number 1
  end

  factory :day do
    name "Monday"
    day_number 1
    date "01/01/2014"
  end
end