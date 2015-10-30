class CreateReviews < ActiveRecord::Migration
  def up
    create_table :reviews do |t|
      t.integer 'potatoes' 
 	    t.references 'movie'
      t.references 'user'
    end
  end
  def down
    drop_table :reviews
  end
end
