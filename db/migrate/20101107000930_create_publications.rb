class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.string :title
      t.string :image
      t.references :board

      t.timestamps
    end
  end

  def self.down
    drop_table :publications
  end
end
