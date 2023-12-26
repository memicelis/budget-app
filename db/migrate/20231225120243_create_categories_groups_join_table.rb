class CreateCategoriesGroupsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_groups, id: false do |t|
      t.references :category, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
    end
  end
end
