class AddAuthornameToChapter < ActiveRecord::Migration
  def change
    add_column :chapters, :authorname, :string
  end
end
