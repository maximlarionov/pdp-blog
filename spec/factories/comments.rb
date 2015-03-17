# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    message 'MyText'
    association :post
    association :user
  end
end
