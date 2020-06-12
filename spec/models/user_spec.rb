require 'rails_helper'

RSpec.describe User, type: :model do
 subject { build(:user) }
  
 describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_least(5).is_at_most(20)}
    it { should validate_uniqueness_of(:username).case_insensitive }
    
    it { should validate_presence_of(:full_name) }
    it { should validate_length_of(:full_name).is_at_least(4).is_at_most(200)}
    
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(255)}
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('valid.email@testing.com').for(:email) } 
  end
  
  describe "associations" do
    it { should have_many(:posts) }
    it { should have_many(:outward_follows) }
    it { should have_many(:inward_follows) }
    it { should have_many(:following_users) }
    it { should have_many(:followed_users) }
  end
  
end

