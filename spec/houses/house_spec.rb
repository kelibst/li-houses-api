require 'rails_helper'

RSpec.describe House, type: :model do
  it 'should test that the factory is valid' do
    user = FactoryBot.build :user
    house = FactoryBot.build :house, user: user, status: 'available'
    expect(house).to be_valid
  end

  it 'should test that user exist' do
    user = FactoryBot.build :user
    house = FactoryBot.build :house, status: 'available'
    expect(house).not_to be_valid
    expect(house.errors.messages[:user]).to include('must exist')
  end

  it 'should validate the presence of name' do
    user = FactoryBot.build :user
    house = FactoryBot.build :house, user: user, name: '', status: 'available'
    expect(house).not_to be_valid
    expect(house.errors.messages[:name]).to include("can't be blank")
  end

  it 'should validate that only the right status is selected' do
    user = FactoryBot.build :user
    house = FactoryBot.build :house, user: user, status: 'not right'
    expect(house).not_to be_valid
    expect(house.errors.messages[:status]).to include("not right is not a valid status")
  end
end
