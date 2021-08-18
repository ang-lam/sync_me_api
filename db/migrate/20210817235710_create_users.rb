class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :company
      t.string :bio
      t.string :email
      t.string :password_digest
      t.string :picture

      t.timestamps
    end
  end
end
