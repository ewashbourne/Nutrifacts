require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do 
    let(:user) { User.create(name: "Ethan Washbourne", email: "ewashbourne@gmail.com",
                             password: "foobar", password_confirmation: "foobar") }

    context 'valid information' do 
      it 'signs in user' do 
        post :create, session: { email: user.email, password: user.password }
        controller.should be_signed_in
      end

      it "redirects to user's profile" do 
        post :create, session: { email: user.email, password: user.password }
        expect(response).to redirect_to(user_path(user))
      end
    end

    context 'invalid information' do 
      it 'does not sign in user' do 
        post :create, session: { email: "blah" }
        controller.should_not be_signed_in
      end

      it 're-renders new' do 
        post :create, session: { email: "blah" }
        expect(response).to render_template(:new)
      end
    end
  end

end
