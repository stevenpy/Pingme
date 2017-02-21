require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.user_name { Faker::Name.first_name }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password }
  end
end