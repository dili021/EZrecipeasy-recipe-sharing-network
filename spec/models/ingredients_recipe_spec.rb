require 'rails_helper'

RSpec.describe IngredientsRecipe, type: :model do
  it { should belong_to(:ingredient) } 
  it { should belong_to(:recipe) } 
end
