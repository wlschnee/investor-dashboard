class LatePaymentCalculator
  attr_reader :investment
  attr_accessor :late_payments

  def initialize(investment)
    @investment = investment
    @late_payments_categorized = {:"0-14" => [], :"15-29" => [], :"30+" => []}
  end

  def get_late_payments_by_category
    step_over_dates
    @late_payments_categorized
  end

  def step_over_dates
    @investment.due_payments.each do |due_payment|
      if due_payment.payment_date < Date.today
        completed_payments = @investment.made_payments.where('payment_date < ?', due_payment.payment_date)
        if total_completed_payments(completed_payments) < (@investment.total_investment_amount - due_payment.expected_remaining_principle)
          calculate_lateness(due_payment)
        end
      end
    end
  end

  def total_completed_payments(completed_payments)
    total_payment = 0
    completed_payments.each do |payment|
      total_payment += payment.payment_amount
    end
    total_payment
  end

  def calculate_lateness(due_payment)
    payments_after_late_payment = @investment.made_payments.where('payment_date > ?', due_payment.payment_date)
    payments_after_late_payment.each do |made_payment|
      if made_payment.actual_remaining_principle < due_payment.expected_remaining_principle
        lateness = made_payment.payment_date - due_payment.payment_date
        case lateness
        when 0..10
          @late_payments_categorized[:"0-14"] << made_payment
          due_payment.category = "0-14"
          break
        when 11..20
          @late_payments_categorized[:"15-29"] << made_payment
          due_payment.category = "15-29"
          break
        else
          @late_payments_categorized[:"30+"] << made_payment
          due_payment.category = "30+"
          break
        end
      end
    end
  end


end