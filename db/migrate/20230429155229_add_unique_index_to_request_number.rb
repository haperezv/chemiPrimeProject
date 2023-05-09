class AddUniqueIndexToRequestNumber < ActiveRecord::Migration[7.0]
  def change
    add_index(:requests, :request_number, unique: true)
  end
end
