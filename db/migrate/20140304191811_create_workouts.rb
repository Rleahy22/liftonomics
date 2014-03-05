class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :number_weeks
      t.integer :user_id
      t.decimal :one_month_gain
      t.decimal :three_month_gain

      t.timestamps
    end
    add_index :workouts, [:user_id, :created_at]
  end
end
