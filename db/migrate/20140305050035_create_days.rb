class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :week_id
      t.string :name
      t.integer :day_number
      t.date :date

      t.timestamps
    end
    add_index :days, [:week_id, :created_at]
  end
end
