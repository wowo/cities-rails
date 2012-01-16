class CreateStates < ActiveRecord::Migration
  def change
    create_table :state do |t|
      t.string :name
      t.string :shortcut
      t.string :capital
      t.integer :population

      t.timestamps
    end
  end
end
