class AddPropsToContacts < ActiveRecord::Migration[7.1]
  def change
    add_column :contacts, :name, :string
    add_column :contacts, :role, :string
    add_column :contacts, :email, :string
    add_column :contacts, :phone, :string
    add_column :contacts, :decision_maker, :boolean
    add_reference :contacts, :client, null: false, foreign_key: true
  end
end
