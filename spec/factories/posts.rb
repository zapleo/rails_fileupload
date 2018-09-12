FactoryBot.define do
  factory :post do
  end

  trait :damage_overview_one do
    damage_overview_one { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/test.png") }
  end

  trait :with_all_attachment do
    damage_overview_one { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/test.png") }
    damage_overview_two { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/test.png") }
    detail_damage_one { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/test.png") }
    detail_damage_two { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/test.png") }
  end
end