class CreateLiner < ActiveRecord::Migration[7.0]
  def change
    create_table :liners do |t|
      t.float :datoa
      t.float :datob
    end
  end
end
