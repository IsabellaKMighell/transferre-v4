class CreateUserExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :user_expenses do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.float :cost
      t.string :category

      t.timestamps
    end
  end
end
