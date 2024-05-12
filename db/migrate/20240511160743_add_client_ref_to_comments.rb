class AddClientRefToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :client, null: false, foreign_key: true
  end
end
