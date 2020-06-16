require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_most(8000) }
  end

  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:ingredients) }
    it { should have_many(:ingredients_recipes) }
  end
end
