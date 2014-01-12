class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :content
      t.string :author

      t.timestamps
    end
  end
end
