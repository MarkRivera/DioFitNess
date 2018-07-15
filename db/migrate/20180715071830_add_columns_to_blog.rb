class AddColumnsToBlog < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :title, :string
    add_column :blogs, :body, :text
    add_column :blogs, :author, :string
  end
end
