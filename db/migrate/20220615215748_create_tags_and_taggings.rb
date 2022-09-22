class CreateTagsAndTaggings < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :taggings_count, null: false, default: 0
      t.timestamps
    end

    create_table :taggings do |t|
      t.references :tag, foreign_key: true, index: true
      t.references :taggable, polymorphic: true
      t.timestamps
    end
  end
end
