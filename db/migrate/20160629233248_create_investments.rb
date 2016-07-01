class CreateInvestments < ActiveRecord::Migration[5.0]
  def change
    create_table :investments do |t|
      t.belongs_to :lender
      t.belongs_to :project, foreign_key: true
      t.float :total_investment_amount
      t.float :outstanding_balance
      t.integer :loan_tenor, default: 12

      t.timestamps
    end
  end
end
