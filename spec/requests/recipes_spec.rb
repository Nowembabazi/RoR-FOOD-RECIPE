require 'rails_helper'

RSpec.describe 'RecipeFood', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'Nick', email: 'olaoye@mail.com', password: 'password') }
  let(:food) { user.foods.create(name: 'apple', measurement: 'kg', price: 4) }
  let(:recipe) do
    user.recipes.create(name: 'Pizza', cooking_time: 1, preparation_time: 2, description: 'Just boil it', public: false)
  end
  describe 'GET /index' do
    before do
      # sign_in user
      get new_recipe_recipe_food_path(recipe)
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
