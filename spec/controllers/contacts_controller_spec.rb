require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'GET #new' do
    it 'assigns a contact as @contact' do
      get :new
      expect(assigns(:contact)).to be_a_kind_of(Contact)
    end
  end

  describe 'POST create' do
    let(:valid_attributes) {
      { subject: 'Subject', from: 'test@spec.com', body: 'body' }
    }

    let(:invalid_attributes) {
      { subject: '', from: '', body: '' }
    }

    it 'assigns a new contact as @contact' do
      post :create, params: {contact: valid_attributes}
      expect(assigns(:contact)).to be_a(Contact)
    end

    context 'with valid params' do
      it 'should send a contact email' do
        post :create, params: {contact: valid_attributes}
        expect(ActionMailer::Base.deliveries.empty?).to be false
      end
    end

    context 'with invalid params' do
      it 're-renders the new template' do
        post :create, params: {contact: invalid_attributes}
        expect(response).to render_template('new')
      end
    end
  end
end
