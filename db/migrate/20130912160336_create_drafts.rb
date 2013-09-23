class CreateDrafts < ActiveRecord::Migration
  def change
  	create_table :drafts do |t|
      t.string  :name
  	  t.integer :creator_id
  	  t.integer :number_of_gms
  	  t.integer :number_of_rounds
  	  t.string  :access
  	  t.string  :type

  	  t.timestamps
  	end
  end
end
