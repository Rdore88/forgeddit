class AddEmailToSession < ActiveRecord::Migration[5.0]
  def change
    add_column :sessions, :email, :string
  end
end
