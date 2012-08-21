class CreateCaptures < ActiveRecord::Migration
  def change
    create_table :captures do |t|
      t.integer :site_id
      t.string :screenshot
      t.string :page_source

      t.timestamps
    end
  end
end
