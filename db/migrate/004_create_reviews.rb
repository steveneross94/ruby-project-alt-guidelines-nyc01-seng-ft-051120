class CreateReviews < ActiveRecord::Migration[5.2]
    def change
        create_table :reviews do |t|
            t.integer :role_id
            t.string :review
        end
    end
end