class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :username
      t.text :comment
      t.integer :link_id

      t.timestamps
    end
  end
end
