class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.text :colname, null: false, limit: 100
      t.text :shdescription, null: false, limit:100
      t.date :begindate, null: false
      t.date :enddate, null: false
      t.index [:colname], unique: true
      t.timestamps null: false
    end
  end
end
