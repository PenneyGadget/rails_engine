require 'faker'

FactoryGirl.define do

  factory :customer do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    created_at Date.today
    updated_at Date.today
  end

end
