FactoryBot.define do
  factory :post do
  end

  trait :with_all_attachment do
    damage_overview_one { fixture_file_upload("#{Rails.root}/spec/fixtures/test.png", 'image/png') }
    damage_overview_two { fixture_file_upload("#{Rails.root}/spec/fixtures/test.png", 'image/png') }
    detail_damage_one { fixture_file_upload("#{Rails.root}/spec/fixtures/test.png", 'image/png') }
    detail_damage_two { fixture_file_upload("#{Rails.root}/spec/fixtures/test.png", 'image/png') }
  end

  trait :with_emtpy_attachments do
    damage_overview_one { }
    damage_overview_two {}
    detail_damage_one {}
    detail_damage_two {}
  end
end