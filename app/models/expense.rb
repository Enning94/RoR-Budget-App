class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :group_expenses, dependent: :destroy
  has_many :groups, through: :group_expenses, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
