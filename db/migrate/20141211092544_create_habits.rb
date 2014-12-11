class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.string :name
      t.string :mission_statement
      t.string :description
      t.integer :duration
      t.string :frequency

      t.timestamps
    end
  end
end
