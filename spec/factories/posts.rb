FactoryGirl.define do 

	factory :post do
	  	content "Lorem ispsum"
	  	# admin
	#   	# This tells FG about the posts associated admin by including admin in the definition of the factory 
	#   	# This allows to define factory posts as follows
	#   	# FactoryGirl.create(:posts, admin: @admin, created_at: 1.day.ago)
	end

end
