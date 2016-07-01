class User < ApplicationRecord
  has_many :projects, foreign_key: :borrower_id
  has_many :investments, foreign_key: :lender_id
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  has_secure_password
end
