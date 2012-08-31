class AddHourInfoToCaptures < ActiveRecord::Migration
  def change
    add_column :captures, :hour_captured, :integer
  end
end
