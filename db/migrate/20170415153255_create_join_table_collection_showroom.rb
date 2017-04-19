class CreateJoinTableCollectionShowroom < ActiveRecord::Migration
  def change
    create_join_table :collections, :showrooms do |t|
       t.index [:collection_id, :showroom_id]
      # t.index [:showroom_id, :collection_id]
    end
  end
end
