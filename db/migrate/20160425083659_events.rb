class Events < ActiveRecord::Migration
  def self.up
  	create_table :events do |t|
  		t.column :title, :string, :limit=>32, :null=>false
  		t.column :price, :float
  		t.column :type_id, :integer
  		t.column :description, :text
  		t.column :date, :timestamp
	end
  end
  def self.down
  	drop_table :events
  end
end
