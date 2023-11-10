class AddForeignKeyToParameterDesings < ActiveRecord::Migration[7.0]
  def change
    add_reference :parameter_desings, :request, foreign_key: true
  end
end
