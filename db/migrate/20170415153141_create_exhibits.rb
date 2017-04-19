class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.text :name, null: false, limit: 100
      t.text :sdescription, null: false, limit:100
      t.integer :insurance, null: false
      t.integer :century, null: false
      t.integer :height, null: false
      t.integer :width, null: false
      t.integer :length, null: false
      t.boolean :tempcontrol, null: false
      t.boolean :himiditycontrol, null: false
      t.boolean :peopleprotect, null: false
      t.references :collection, index: true, foreign_key: true
	  t.index [:name], unique: true
      t.timestamps null: false
    end
  end
end
