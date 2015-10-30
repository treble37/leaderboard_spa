class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :games_won
      t.integer :games_lost
      t.decimal :win_loss_ratio

      t.timestamps null: false
    end
  end
end
