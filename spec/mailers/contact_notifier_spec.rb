require "rails_helper"

RSpec.describe ContactNotifier, type: :mailer do
  let(:contact) {
    FactoryGirl.create(:contact)
  }

  let(:contact_no_from) {
    FactoryGirl.create(:contact_no_from)
  }

  describe "contact_mail" do
    it "should send a contact email" do
      email = ContactNotifier.contact_mail(contact).deliver_now
      expect(ActionMailer::Base.deliveries.empty?).to be false
    end

    it "should clearly state in the subject where does it come from" do
      email = ContactNotifier.contact_mail(contact).deliver_now
      expect(email.subject).to eq("[SNADA CONTACT FORM] #{contact.subject}")
    end

    it "should have the correct from" do
      email = ContactNotifier.contact_mail(contact).deliver_now
      expect(email.from).to eq([contact.from])
    end

    it "should be sent to my personal inbox" do
      email = ContactNotifier.contact_mail(contact).deliver_now
      expect(email.to).to eq([ENV['PERSONAL_MAIL']])
    end

    it "should contain the passed body" do
      email = ContactNotifier.contact_mail(contact).deliver_now
      expect(email.body.encoded).to include(contact.subject)
    end
  end
end
