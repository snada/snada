require 'rails_helper'

RSpec.describe Contact, type: :model do
  context "validation" do
    let(:contact) {
      FactoryGirl.create(:contact)
    }

    let(:invalid_mail_contact) do
      FactoryGirl.create(:invalid_mail_contact)
    end

    it "should be valid when email is ok" do
      expect(contact).to be_valid
    end

    it "should not be valid when email is ko" do
      expect(invalid_mail_contact).not_to be_valid
    end
  end
end
