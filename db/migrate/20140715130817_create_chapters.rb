class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :round
      t.string :author
      t.text :body
      t.references :story, index: true

      t.timestamps
    end
  end
end
