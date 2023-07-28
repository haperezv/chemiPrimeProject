class ChangeTimeMezclaInRequests < ActiveRecord::Migration[7.0]
  def up
    # Usamos la cláusula "USING" para convertir explícitamente los valores existentes de text a date.
    # En este ejemplo, asumimos que los valores de "time_mezcla" están en el formato 'YYYY-MM-DD'.
    # Si el formato es diferente, debes ajustar la expresión de conversión en consecuencia.
    execute <<-SQL
      ALTER TABLE requests
      ALTER COLUMN time_mezcla TYPE date
      USING (CASE WHEN trim(time_mezcla) <> '' THEN to_date(time_mezcla, 'YYYY-MM-DD') END);
    SQL
  end
  def down
    change_column :requests, :time_mezcla, :text
  end
end
