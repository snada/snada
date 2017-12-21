FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Post title number #{n}" }
    sequence(:description) { |n| "Post description number #{n}" }
    sequence(:body) { |n| "Post body number #{n}" }
    sequence(:keywords) { |n| "keyword#{n}_1, keyword#{n}_2, keyword#{n}_3" }
    category_list 'blog, programming, ruby'
  end
end
