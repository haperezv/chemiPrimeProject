class AddObservacionesToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :observaciones, :text
  end
end
