class CreateMadePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :made_payments do |t|
      t.date :payment_date
      t.float :payment_amount
      t.float :actual_remaining_principle
      t.belongs_to :investment, foreign_key: true

      t.timestamps
    end
  end
end
