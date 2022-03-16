class ChangeFlightDurationToInteger < ActiveRecord::Migration[6.1]
  def up
    change_column :flights, :duration, :integer
  end

  def down
    change_column :flights, :duration, :string
  end 
end
