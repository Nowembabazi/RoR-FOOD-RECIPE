require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'Nick', email: 'olaoye@mail.com', password: 'password') }
  let(:food) { user.foods.create(name: 'apple', measurement: 'kg', price: 4) }

  describe 'GET /index' do
    before do
      get foods_path
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET /new' do
    before do
      get new_food_path(food)
    end

    it 'response with html' do
      get '/foods/new'
      expect(response).to have_http_status(302)
      expect(response.content_type).to include 'text/html'
    end
  end
end
