class Project < ApplicationRecord
  belongs_to :borrower, class_name: 'User'
  has_many :investments
  has_many :lenders, through: :investments, class_name: 'User'
end
