class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string: :title
      t.text: :body
      t.references :client, foreign_key: true, null: false
      t.timestamps
    end
  end
end
