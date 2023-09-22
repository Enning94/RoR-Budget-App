class Group < ApplicationRecord
  belongs_to :user
  has_many :group_entities, dependent: :destroy
  has_many :entities, through: :group_entities, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  validates :icon, presence: true

  def total_payment
    entities.sum(:amount)
  end

  def recent_entities(limit = 3)
    entities.order(created_at: :desc).limit(limit)
  end
end
