class Task < ApplicationRecord
  validates :name, presence: true
  validate :validate_name_not_include_comma

  belongs_to :user

  private

  def validate_name_not_include_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
