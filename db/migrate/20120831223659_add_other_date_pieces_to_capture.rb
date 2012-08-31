class AddOtherDatePiecesToCapture < ActiveRecord::Migration
  def change
    add_column :captures, :year_captured, :integer
    add_column :captures, :month_captured, :integer
    add_column :captures, :day_captured, :integer

    add_index :captures, :year_captured
    add_index :captures, :month_captured
    add_index :captures, :day_captured
    add_index :captures, :hour_captured
  end
end
