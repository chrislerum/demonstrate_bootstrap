FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "hello#{n}@gmail.com" }
    password 'nowadays'
  end
end
