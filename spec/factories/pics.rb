FactoryGirl.define do
  factory :pic do
    upload { File.new("#{Rails.root}/spec/support/fixtures/cat.jpg") }
  end
end
