class AddUserIdToBet < ActiveRecord::Migration
  def self.up
    add_column :bets, :user_id, :integer
  end

  def self.down
    remove_column :bets, :user_id
  end
end
