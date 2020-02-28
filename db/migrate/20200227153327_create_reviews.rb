class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_stars
      t.integer :instrument_stars
      t.text :user_review
      t.text :instrument_review
      t.references :request, foreign_key: true
      t.timestamps
    end
  end
end
