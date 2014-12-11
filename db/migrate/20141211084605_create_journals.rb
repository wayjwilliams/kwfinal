class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.text :body
      t.references :habit, index: true

      t.timestamps
    end
  end
end
