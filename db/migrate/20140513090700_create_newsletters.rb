class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.text :to
      t.integer :blog_id
      t.string :status

      t.timestamps
    end
  end
end
