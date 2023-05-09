class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :request_number
      t.date :request_date

      t.timestamps
    end
  end
end
