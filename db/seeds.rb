# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Samer", email: "samer@liwwa.com", password: 'password')
User.create(name: "Will", email: "will@flatironschool.com", password: 'password')
User.create(name: "Steven", email: "steven@flatironschool.com", password: 'password')
User.create(name: "Sophie", email: "sophie@flatironschool.com", password: 'password')
User.create(name: "Antoin", email: "anotoin@flatironschool.com", password: 'password')
User.create(name: "Joe", email: "joe@flatironschool.com", password: 'password')

Project.create(title: "New photography business", description: "Help me get my new photography business off the ground", borrower_id: 2)
Project.create(title: "New computers for the lab", description: "We want to get new computers to loan to our less fortunate students", borrower_id: 6)
Project.create(title: "Elixir Course", description: "Elixir is the coolest new language and I want to start a course for it", borrower_id: 3)
Project.create(title: "Cat toy store", description: "The cats of New York City need more toys!", borrower_id: 4)
Project.create(title: "A great new opportunity", description: "My new project will be great", borrower_id: 5)
Investment.create(lender: User.first, project: Project.first, total_investment_amount: 1100.00, outstanding_balance: 1100.00, loan_tenor: 12)
Investment.create(lender: User.first, project: Project.second, total_investment_amount: 2000.00, outstanding_balance: 1100.00, loan_tenor: 12)
Investment.create(lender: User.first, project: Project.third, total_investment_amount: 1500.00, outstanding_balance: 1100.00, loan_tenor: 12)
Investment.create(lender: User.first, project: Project.fourth, total_investment_amount: 9000.00, outstanding_balance: 1100.00, loan_tenor: 12)
Investment.create(lender: User.first, project: Project.fifth, total_investment_amount: 750.00, outstanding_balance: 1100.00, loan_tenor: 12)

MadePayment.create(payment_date: Date.new(2016,1,15), payment_amount: 100, investment_id: 1)
MadePayment.create(payment_date: Date.new(2016,2,14), payment_amount: 30, investment_id: 1)
MadePayment.create(payment_date: Date.new(2016,4,22), payment_amount: 170, investment_id: 1)
MadePayment.create(payment_date: Date.new(2016,5,9), payment_amount: 200, investment_id: 1)
MadePayment.create(payment_date: Date.new(2016,6,18), payment_amount: 100, investment_id: 1)
MadePayment.create(payment_date: Date.new(2016,6,30), payment_amount: 100, investment_id: 1)

MadePayment.create(payment_date: Date.new(2016,1,15), payment_amount: 100, investment_id: 2)
MadePayment.create(payment_date: Date.new(2016,2,14), payment_amount: 100, investment_id: 2)
MadePayment.create(payment_date: Date.new(2016,3,10), payment_amount: 100, investment_id: 2)
MadePayment.create(payment_date: Date.new(2016,4,22), payment_amount: 50, investment_id: 2)
MadePayment.create(payment_date: Date.new(2016,5,9), payment_amount: 150, investment_id: 2)
MadePayment.create(payment_date: Date.new(2016,6,18), payment_amount: 100, investment_id: 2)
MadePayment.create(payment_date: Date.new(2016,6,30), payment_amount: 100, investment_id: 2)

MadePayment.create(payment_date: Date.new(2016,1,15), payment_amount: 100, investment_id: 3)
MadePayment.create(payment_date: Date.new(2016,2,14), payment_amount: 30, investment_id: 3)
MadePayment.create(payment_date: Date.new(2016,4,22), payment_amount: 170, investment_id: 3)
MadePayment.create(payment_date: Date.new(2016,5,9), payment_amount: 200, investment_id: 3)
MadePayment.create(payment_date: Date.new(2016,6,18), payment_amount: 100, investment_id: 3)
MadePayment.create(payment_date: Date.new(2016,6,30), payment_amount: 100, investment_id: 3)

MadePayment.create(payment_date: Date.new(2016,1,15), payment_amount: 100, investment_id: 4)
MadePayment.create(payment_date: Date.new(2016,2,14), payment_amount: 30, investment_id: 4)
MadePayment.create(payment_date: Date.new(2016,4,22), payment_amount: 170, investment_id: 4)
MadePayment.create(payment_date: Date.new(2016,5,9), payment_amount: 200, investment_id: 4)
MadePayment.create(payment_date: Date.new(2016,6,18), payment_amount: 100, investment_id: 4)
MadePayment.create(payment_date: Date.new(2016,6,30), payment_amount: 100, investment_id: 4)

MadePayment.create(payment_date: Date.new(2016,1,15), payment_amount: 62.50, investment_id: 5)
MadePayment.create(payment_date: Date.new(2016,2,14), payment_amount: 30, investment_id: 5)
MadePayment.create(payment_date: Date.new(2016,4,22), payment_amount: 95, investment_id: 5)
MadePayment.create(payment_date: Date.new(2016,5,9), payment_amount: 62.50, investment_id: 5)
MadePayment.create(payment_date: Date.new(2016,6,18), payment_amount: 62.50, investment_id: 5)
MadePayment.create(payment_date: Date.new(2016,6,30), payment_amount: 62.50, investment_id: 5)

date = Date.new(2016,2,1)
11.times do |i|
  due_payment = DuePayment.create(payment_date: date + i.month, investment_id: 1)
  due_payment.payment_amount = (due_payment.investment.total_investment_amount / due_payment.investment.loan_tenor )
  due_payment.expected_remaining_principle = (due_payment.investment.total_investment_amount - (due_payment.payment_amount * (i + 1)))
  due_payment.save
end

11.times do |i|
  due_payment = DuePayment.create(payment_date: date + i.month, investment_id: 2)
  due_payment.payment_amount = (due_payment.investment.total_investment_amount / due_payment.investment.loan_tenor )
  due_payment.expected_remaining_principle = (due_payment.investment.total_investment_amount - (due_payment.payment_amount * (i + 1)))
  due_payment.save
end

11.times do |i|
  due_payment = DuePayment.create(payment_date: date + i.month, investment_id: 3)
  due_payment.payment_amount = (due_payment.investment.total_investment_amount / due_payment.investment.loan_tenor )
  due_payment.expected_remaining_principle = (due_payment.investment.total_investment_amount - (due_payment.payment_amount * (i + 1)))
  due_payment.save
end

11.times do |i|
  due_payment = DuePayment.create(payment_date: date + i.month, investment_id: 4)
  due_payment.payment_amount = (due_payment.investment.total_investment_amount / due_payment.investment.loan_tenor )
  due_payment.expected_remaining_principle = (due_payment.investment.total_investment_amount - (due_payment.payment_amount * (i + 1)))
  due_payment.save
end

11.times do |i|
  due_payment = DuePayment.create(payment_date: date + i.month, investment_id: 5)
  due_payment.payment_amount = (due_payment.investment.total_investment_amount / due_payment.investment.loan_tenor )
  due_payment.expected_remaining_principle = (due_payment.investment.total_investment_amount - (due_payment.payment_amount * (i + 1)))
  due_payment.save
end