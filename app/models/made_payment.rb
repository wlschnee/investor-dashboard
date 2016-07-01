class MadePayment < ApplicationRecord
  belongs_to :investment
  before_save :update_outstanding_balance

  private

  def update_outstanding_balance
    self.investment.outstanding_balance -= self.payment_amount
    self.actual_remaining_principle = self.investment.outstanding_balance
    self.investment.save
  end

end
