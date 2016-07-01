class Investment < ApplicationRecord
  belongs_to :lender, class_name: 'User'
  belongs_to :project
  has_one :borrower, through: :project, class_name: 'User'
  has_many :due_payments
  has_many :made_payments
end
