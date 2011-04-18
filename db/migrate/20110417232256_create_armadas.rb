class CreateArmadas < ActiveRecord::Migration
  def self.up
    create_table :armadas do |t|
      t.string :name
      t.text :description
      t.integer :cost
      t.integer :creator_id
      t.timestamps
    end
  end

  def self.down
    drop_table :armadas
  end
end
