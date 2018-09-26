FactoryBot.define do
  factory :contact do
    skip_create

    sequence(:subject) { |n| "Subject number #{n}" }
    sequence(:body) { |n| "body #{n}" }
    sequence(:from) { |n| "sender#{n}@spec.com" }

    factory(:invalid_mail_contact) do
      from { 'invalid' }
    end
  end
end
