class Post < ApplicationRecord
  IMAGE_FORMATS = %w(image/jpg image/png image/jpeg)
  REQUIRED_FIELDS = %i(damage_overview_one damage_overview_two detail_damage_one detail_damage_two)
  FILE_FIELDS = [:additional] + REQUIRED_FIELDS

  FILE_FIELDS.each do |f|
    has_one_attached f
  end

  REQUIRED_FIELDS.each do |f|
    validate (f.to_s + '_required').to_sym
    validate (f.to_s + '_format').to_sym
  end

  private

  REQUIRED_FIELDS.each do |f|
    define_method (f.to_s + '_required').to_sym do
      errors.add(f, 'required') unless self.send(f).attached?
    end

    define_method (f.to_s + '_format').to_sym do
      errors.add(f, 'must have image format') if self.send(f).attached? && !self.send(f).content_type.in?(IMAGE_FORMATS)
    end
  end
end
