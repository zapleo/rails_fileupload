class Post < ApplicationRecord
  REQUIRED_FIELDS = [:damage_overview_one, :damage_overview_two, :detail_damage_one, :detail_damage_two].freeze
  FILE_FIELDS = [:additional] + REQUIRED_FIELDS

  # FILE_FIELDS.each do |f|
  #   has_one_attached f
  # end

  #has_one_attached :damage_overview_one
  has_one_attached :damage_overview_two


  #validate :damage_overview_one_required

  private

  # def damage_overview_one_required
  #   unless self.damage_overview_one.attached?
  #     p "zashlo"
  #     errors.add(:damage_overview_one, 'required')
  #   end
  # end
end
