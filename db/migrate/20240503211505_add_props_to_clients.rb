class AddPropsToClients < ActiveRecord::Migration[7.1]
  def change
    add_column :clients, :company_name, :string
    add_column :clients, :value, :integer
    add_column :clients, :user_id, :integer
    add_index :clients, :user_id
  end
end
