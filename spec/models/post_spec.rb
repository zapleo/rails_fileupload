RSpec.describe Post, type: :model do
  subject { build :post }

  context 'have constants' do
    it { expect(Post::REQUIRED_FIELDS).to eq(%i(damage_overview_one damage_overview_two detail_damage_one detail_damage_two)) }
    it { expect(Post::FILE_FIELDS).to eq(%i(additional damage_overview_one damage_overview_two detail_damage_one detail_damage_two )) }
  end

  context 'have required validation without file' do
    it 'validate required fields' do
      subject.validate
      Post::REQUIRED_FIELDS.each do |f|
        expect(subject.errors.messages[f]).to include 'required'
      end
    end
  end
end
