class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid? && verify_recaptcha(model: @contact)
      ContactNotifier.contact_mail(@contact).deliver_now
      redirect_to new_contact_path, notice: "Your message was sent, thanks!"
    else
      render :new
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:subject, :from, :body)
    end
end
