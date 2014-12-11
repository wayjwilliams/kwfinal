class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|

      t.timestamps
    end
  end
end
