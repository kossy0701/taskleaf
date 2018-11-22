class Task < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validate :validate_name_not_include_comma

  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  private

  def validate_name_not_include_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
