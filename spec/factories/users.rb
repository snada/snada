FactoryGirl.define do
  factory :user do
    sequence(:nickname) { |n| "user#{n}" }

    factory :github_user do
      sequence(:github_uid)
      github_avatar { |u| "https://avatars.githubusercontent.com/u/#{u.github_uid}?v=3"}
      github_url { |u| "https://github.com/#{u.nickname}" }
      role 0

      factory(:admin_user) do
        role 1
      end
    end
  end
end
