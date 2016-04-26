class Types < ActiveRecord::Migration
  def self.up
  	create_table :types do |t|
  		t.column :name, :string
  	end

	  Type.create :name => "Party"
	  Type.create :name => "Lunch"
	  Type.create :name => "Dinner"
	  Type.create :name => "Meeting"
  end

  def self.down
  	drop_table :types
  end
end
