class CreateShowrooms < ActiveRecord::Migration
  def change
    create_table :showrooms do |t|
      t.text :roomname, null: false
      t.index [:roomname], unique: true

      t.timestamps null: false
    end
  end
end
