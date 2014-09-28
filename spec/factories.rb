FactoryGirl.define do
  factory :admin do 
  # by passing the symbol :admin to the factory command, we tell FG that the subsequent definition is for a Admin model object
    email    "example@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :post do
  	content "Lorem ispsum"
  	admin
  	# This tells FG about the posts associated admin by including admin in the definition of the factory 
  	# This allows to define factory posts as follows
  	# FactoryGirl.create(:posts, admin: @admin, created_at: 1.day.ago)
  end
end