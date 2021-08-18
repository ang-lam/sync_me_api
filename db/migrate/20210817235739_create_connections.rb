class CreateConnections < ActiveRecord::Migration[6.1]
  def change
    create_table :connections do |t|
      t.integer :mentor_id
      t.integer :mentee_id

      t.timestamps
    end
  end
end
