class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :workout_id

      t.timestamps
    end
    add_index :weeks, [:workout_id, :created_at]
  end
end
