
FactoryGirl.define do
  factory :todo do
		description { Faker::Lorem.sentence(3, true, 1)}
	end

	factory :invalid_todo, class: Todo do
		description nil
	end
end
