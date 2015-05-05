class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :title 
    	t.string :body 
    	t.string :link
    	t.timestamps
    end
  end
end
