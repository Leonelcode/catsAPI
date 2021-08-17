require 'rails_helper'

RSpec.describe Cat, type: :model do
  describe 'cat creation' do

    let(:cat) { FactoryBot.create(:cat) }

    it 'creates a new cat' do
      expect { cat }.to change { Cat.count }.by(1)
    end
  end

  describe 'validations' do
    let(:cat) { FactoryBot.build(:cat, name: nil, description: nil) }

    it 'does not create a cat without a name' do
      expect do
        cat.save
        expect(cat.errors.messages[:name]).to include("can't be blank")
      end.to change { Cat.count }.by(0)
    end

    it 'does not create a cat without description' do
      expect do
        cat.save
        expect(cat.errors.messages[:description]).to include("can't be blank")
      end.to change { Cat.count }.by(0)
    end
  end
end