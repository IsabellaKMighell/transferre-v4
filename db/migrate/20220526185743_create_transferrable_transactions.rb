class CreateTransferrableTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transferrable_transactions do |t|
      t.integer :transactor_id
      t.integer :transactee_id
      t.float :cost
      t.string :category
      t.string :message
      t.boolean :confirmed
      t.boolean :transaction_to_user

      t.timestamps
    end
  end
end
