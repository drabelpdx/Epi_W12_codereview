class ChangeDescriptionStringsToText < ActiveRecord::Migration
  def change
    change_column :categories, :description, :text
    change_column :projects, :description, :text
  end
end
