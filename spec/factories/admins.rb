FactoryGirl.define do
  factory :admin do 
  # by passing the symbol :admin to the factory command, we tell FG that the subsequent definition is for a Admin model object
    
    # email   "example@example.com"
    sequence(:email) { |n| "user-#{n}@example.com" }
    
    password "foobar"
    password_confirmation "foobar"
  end
end