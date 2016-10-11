FactoryGirl.define do
  factory :github_hash, class: OmniAuth::AuthHash do
    skip_create

    provider 'github'
    uid { SecureRandom.random_number(1_000_000_000).to_s }

    transient do
      sequence(:nickname) { |n| "user#{n}" }
    end

    info do |h|
      {
        nickname: h.nickname,
        email: nil,
        name: "Github User #{h.uid}",
        image: "https://avatars.githubusercontent.com/u/#{h.uid}?v=3",
        urls: {
          GitHub: "https://github.com/#{h.nickname}",
          Blog: nil
        }
      }
    end

    credentials do
      {
        token: "",
        expires: false
      }
    end

    extra do |h|
      {
        raw_info: {
          login: h.nickname,
          id: h.uid,
          avatar_url: "https://avatars.githubusercontent.com/u/#{h.uid}?v=3",
          gravatar_id: "",
          url: "https://api.github.com/users/#{h.nickname}",
          html_url: "https://github.com/#{h.nickname}",
          followers_url: "https://api.github.com/users/#{h.nickname}/followers",
          following_url: "https://api.github.com/users/#{h.nickname}/following{/other_user}",
          gists_url: "https://api.github.com/users/#{h.nickname}/gists{/gist_id}",
          starred_url: "https://api.github.com/users/#{h.nickname}/starred{/owner}{/repo}",
          subscriptions_url: "https://api.github.com/users/#{h.nickname}/subscriptions",
          organizations_url: "https://api.github.com/users/#{h.nickname}/orgs",
          repos_url: "https://api.github.com/users/#{h.nickname}/repos",
          events_url: "https://api.github.com/users/#{h.nickname}/events{/privacy}",
          received_events_url: "https://api.github.com/users/#{h.nickname}/received_events",
          type: "User",
          site_admin: false,
          name: "Github User",
          company: nil,
          blog: nil,
          location: "Torino",
          email: nil,
          hireable: nil,
          bio: nil,
          public_repos: SecureRandom.random_number(100),
          public_gists: SecureRandom.random_number(100),
          followers: SecureRandom.random_number(10),
          following: SecureRandom.random_number(1000),
          created_at: "2013-01-18T17:58:47Z",
          updated_at: "2016-02-18T10:39:14Z",
        }
      }
    end
  end
end
