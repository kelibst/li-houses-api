require 'rails_helper'

RSpec.describe House, type: :model do
    it 'should test that the factory is valid' do
        user = FactoryBot.build :user
        house = FactoryBot.build :house, user: user, status: "available"
        expect(house).to be_valid
    end
end