class AddLanguageToNewsletters < ActiveRecord::Migration
  def change
    add_column :newsletters, :language, :string
  end
end
