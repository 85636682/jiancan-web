FactoryGirl.define do
  factory :comment do
    content "MyString"
score 1
user_id 1
commentable_id 1
commentable_type "MyString"
  end

end
