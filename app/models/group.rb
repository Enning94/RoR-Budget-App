class Group < ApplicationRecord
  belongs_to :user
  has_many :group_entities, dependent: :destroy
  has_many :entities, through: :group_entities

  validates :name, presence: true
  validates :icon, presence: true

  def total_payment
    entities.sum(:amount)
  end
end
