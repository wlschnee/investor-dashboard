class InvestmentsController < ApplicationController
  before_action :select_investment, only: [:show]
  def index
    @investments = Investment.all
  end

  def show
    @late_payments = LatePaymentCalculator.new(@investment).get_late_payments_by_category
  end

  private

  def select_investment
    @investment = Investment.find(params[:id])
  end

end
