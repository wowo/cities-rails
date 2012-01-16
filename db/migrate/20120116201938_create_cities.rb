class CreateCities < ActiveRecord::Migration
  def change
    create_table :city do |t|
      t.string :name
      t.integer :rank
      t.integer :state_id
      t.integer :population
      t.decimal :land_area
      t.decimal :population_density

      t.timestamps
    end
  end
end
