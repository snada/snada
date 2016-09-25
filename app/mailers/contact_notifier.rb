class ContactNotifier < ApplicationMailer
  def contact_mail(contact)
    @contact = contact

    mail(
      to: ENV['PERSONAL_MAIL'],
      from: @contact.from,
      subject: "[SNADA CONTACT FORM] #{@contact.subject}"
    )
  end
end
