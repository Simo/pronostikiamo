class CreateChampions < ActiveRecord::Migration
  def self.up
    create_table :champions do |t|
      t.string :nome_campionato
      t.integer :priority
      t.string :ambito
      t.timestamps
    end
  end

  def self.down
    drop_table :champions
  end
end
