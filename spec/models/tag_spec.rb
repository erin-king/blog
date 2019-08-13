require 'rails_helper'

describe Tag, type: :model do
  describe 'relationships' do
    it { should have_many(:taggings) }
    it { should have_many(:articles).through(:taggings) }
  end

  describe 'instance methods' do
    it "#to_s" do
      tag = Tag.create(name: "Taggy")

      expect(tag.name).to be_a(String)
    end
  end
end
