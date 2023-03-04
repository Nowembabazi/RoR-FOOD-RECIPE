require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    let(:user) do
      User.new(name: 'John Doe', email: 'john@example.com', password: 'password', password_confirmation: 'password')
    end
    let(:food) { Food.new(name: 'apple', measurement_unit: 'grams', price: 5, quantity: 1, user:) }

    before do
      user.skip_confirmation!
      user.save!
    end

    it 'is valid with valid attributes' do
      expect(food).to be_valid
    end

    it 'is not valid without a name' do
      food.name = nil
      expect(food).to_not be_valid
    end

    it 'is not valid without a measurement unit' do
      food.measurement_unit = nil
      expect(food).to_not be_valid
    end
  end
end
