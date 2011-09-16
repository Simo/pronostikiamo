class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions, :id => false do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end
  end

  def self.down
    drop_table :positions
  end
end
