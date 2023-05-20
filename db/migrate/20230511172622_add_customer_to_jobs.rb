class AddCustomerToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :customer, :string, null: false
  end
end
