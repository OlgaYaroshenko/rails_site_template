class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :site
      t.boolean :visible
      t.string :type
      t.string :country

      t.timestamps
    end
  end
end
