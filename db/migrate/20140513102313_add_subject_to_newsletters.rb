class AddSubjectToNewsletters < ActiveRecord::Migration
  def change
    add_column :newsletters, :subject, :string
  end
end
