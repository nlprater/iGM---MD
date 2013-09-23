class CreateSelections < ActiveRecord::Migration
  def change
  	create_table :selections do |t|
  	  t.belongs_to :user
  	  t.belongs_to :draft
  	  t.belongs_to :round
  	  t.belongs_to :team
  	  t.belongs_to :player
      t.belongs_to :draft_position
      t.integer :overall_position

  	  t.timestamps
  	end
  	add_index :selections, :user_id
  	add_index :selections, :draft_id
  	add_index :selections, :round_id
  	add_index :selections, :team_id
  	add_index :selections, :player_id
  	add_index :selections, :draft_position_id
  	add_index :selections, :overall_position
  end
end
