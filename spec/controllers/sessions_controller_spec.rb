require 'factory_girl'
require 'rails_helper'

describe SessionsController do
  describe '#login' do
    context 'with valid credentials' do
      before :each do
        @user = FactoryGirl.create(:user)
        post :create, user: @user.attributes
      end

      it 'upon login, sets session[:id] to the user\'s id' do
        expect(session[:id]).to eq(@user.id)
      end

      it 'redirects to root_url upon successful login' do
        expect(response).to redirect_to root_url
      end
    end

    # context 'without valid credentials' do
    #   it 'renders the login page' do
    #     expect(response).to render 'login'
    #   end
    #   xit 'displays an error message for users with invalid credentials'
    # end
  end
end
