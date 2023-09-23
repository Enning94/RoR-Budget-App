class Group < ApplicationRecord
  belongs_to :user
  has_many :group_expenses, dependent: :destroy
  has_many :expenses, through: :group_expenses, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  validates :icon, presence: true

  def total_payment
    expenses.sum(:amount)
  end

  def recent_expenses(limit = 3)
    expenses.order(created_at: :desc).limit(limit)
  end
end
