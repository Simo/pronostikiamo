class AddRoleToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role_id, :integer, :default => 2
  end

  def self.down
    remove_column :users, :role_id
  end
end
