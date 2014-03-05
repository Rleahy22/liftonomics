class CreateLifts < ActiveRecord::Migration
  def change
    create_table :lifts do |t|
      t.string :name
      t.string :upper_lower
      t.string :primary_muscle
      t.string :secondary_muscle
      t.string :push_pull
      t.string :instructions_one
      t.string :instructions_two
      t.string :instructions_three
      t.string :instructions_four
      t.string :instructions_five
      t.string :instructions_six
      t.string :instructions_seven

      t.timestamps
    end
  end
end
