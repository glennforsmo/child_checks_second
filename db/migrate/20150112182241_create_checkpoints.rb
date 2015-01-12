class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.string :checkpoint, null: false

      t.integer :child_id
      t.timestamps

      # add_index :checkpoints, :child_id
    end
  end
end
