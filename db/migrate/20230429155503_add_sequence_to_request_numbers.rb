class AddSequenceToRequestNumbers < ActiveRecord::Migration[7.0]
  def change
    execute <<-SQL
      CREATE SEQUENCE request_number_seq;
      ALTER TABLE requests ALTER COLUMN request_number SET DEFAULT nextval('request_number_seq');
    SQL
  end
end
