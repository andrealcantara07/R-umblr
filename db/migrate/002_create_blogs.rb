class CreateBlogs < ActiveRecord::Migration[5.0] 
    def change
        create_table :blogs do |t|
            t.string :title
            t.text :content
            t.integer :user_id
        end
    end
end 