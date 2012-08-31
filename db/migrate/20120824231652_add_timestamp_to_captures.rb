class AddTimestampToCaptures < ActiveRecord::Migration
  def change
    add_column :captures, :captured_time, :integer
  end
end
