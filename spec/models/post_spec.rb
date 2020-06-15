require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_most(2000) }
  end

  describe 'associations' do
    it { should belong_to(:author) }
  end
end
