class CreateHouse < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.text :address
    end
  end
end
