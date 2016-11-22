require 'rails_helper'

describe 'User requests', type: :request do
  describe 'POST create' do
    describe 'with valid data' do
      it 'creates a new user' do
        post '/users', {user: FactoryGirl.attributes_for(:user)}
        expect(User.count).to eq(1)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
