FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Post title number #{n}" }
    sequence(:description) { |n| "Post description number #{n}" }
    sequence(:body) { |n| "Post body number #{n}" }
    category_list 'blog, programming, ruby'
  end
end
