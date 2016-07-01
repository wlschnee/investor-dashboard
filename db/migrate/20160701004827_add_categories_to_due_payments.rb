class AddCategoriesToDuePayments < ActiveRecord::Migration[5.0]
  def change
    add_column :due_payments, :category, :string
  end
end
