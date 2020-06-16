require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it { should have_many(:ingredients_recipes) } 
  it { should have_many(:recipes) } 
end
