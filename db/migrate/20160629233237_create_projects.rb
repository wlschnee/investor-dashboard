class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.belongs_to :borrower

      t.timestamps
    end
  end
end
