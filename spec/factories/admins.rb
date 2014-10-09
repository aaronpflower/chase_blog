FactoryGirl.define do
  factory :admin do 
    sequence(:email) { |n| "user-#{n}@example.com" }
    
    password "foobar"
    password_confirmation "foobar"
  end
end