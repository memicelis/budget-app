class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :related_transactions, class_name: 'Transaction'

  validates :name, :icon, presence: true

  def total_amount_of_transactions
    related_transactions.sum(:amount)
  end
end
