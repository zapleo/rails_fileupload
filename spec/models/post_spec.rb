RSpec.describe Post, type: :model do
  context 'have constants' do
    it { expect(Post::REQUIRED_FIELDS).to eq(%i(damage_overview_one damage_overview_two detail_damage_one detail_damage_two)) }
    it { expect(Post::REQUIRED_FIELDS).to eq(%i(damage_overview_one damage_overview_two detail_damage_one detail_damage_two additional)) }
  end

  context 'validation damage_overview_one without file' do
    let(:post) { create :post }

    it 'validate required fields' do
      post.validate
      expect(post.errors[:damage_overview_one]).to include 'Damage overview one required'
    end
  end

  context 'validation of damage_overview_one with file' do
    let(:post) { create :post, :with_damage_overview_one}

    it 'validate required fields' do
      post.validate
      expect(post.errors[:damage_overview_one]).not_to include 'Damage overview one required'
    end
  end
end
