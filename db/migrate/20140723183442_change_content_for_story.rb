class ChangeContentForStory < ActiveRecord::Migration
    change_table :stories do |t|  
        t.change :content, :text, :limit => nil 
    end
end
