class ChangeColumnNameAirport < ActiveRecord::Migration[6.1]
  def up
    rename_column :airports, :name, :code
  end

end
