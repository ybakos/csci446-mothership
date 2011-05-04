# This migration creates a table for component data.
class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.integer :iid
      t.string :resource_name
      t.integer :count
      t.integer :armada_id

      t.timestamps
    end
  end

  def self.down
    drop_table :components
  end

end
