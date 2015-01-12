class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name, null: false
      t.integer :age, null: false

      t.timestamps
    end
  end
end
