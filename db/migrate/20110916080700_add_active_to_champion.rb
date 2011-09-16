class AddActiveToChampion < ActiveRecord::Migration
  def self.up
    add_column :champions, :active, :boolean
  end

  def self.down
    remove_column :champions, :active
  end
end
