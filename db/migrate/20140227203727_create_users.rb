class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.integer :height_feet
      t.integer :height_inches
      t.integer :weight
      t.integer :max_bench
      t.integer :max_squat
      t.integer :max_deadlift
      t.string :level
      t.string :goal
      
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :remember_token
  end
end
