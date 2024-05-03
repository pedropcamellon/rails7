class AddPropsToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :title, :string
    add_column :comments, :body, :text
    add_reference :comments, :client, null: false, foreign_key: true
  end
end
