class ContactNotifier < ApplicationMailer
  def contact_mail(subject, from, body)
    @subject = subject
    @from = from.blank? ? ENV['PERSONAL_MAIL'] : from
    @body = body

    mail(
      to: ENV['PERSONAL_MAIL'],
      from: @from,
      subject: "[SNADA CONTACT FORM] #{subject}"
    )
  end
end
