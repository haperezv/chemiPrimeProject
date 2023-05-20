class AddTypeSampleToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :sample, :string, null: false
    add_column :jobs, :density, :string, null: false
    change_column_null :jobs, :base, false
  end
end
