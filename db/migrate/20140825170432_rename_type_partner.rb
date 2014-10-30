class RenameTypePartner < ActiveRecord::Migration
  def change
    rename_column :partners, :type, :role
  end
end
