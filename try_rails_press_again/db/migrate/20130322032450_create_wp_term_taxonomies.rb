class CreateWpTermTaxonomies < ActiveRecord::Migration
  def change
    create_table :wp_term_taxonomies do |t|
      t.integer :term_taxonomy_id
      t.integer :term_id
      t.string :taxonomy
      t.text :description
      t.integer :parent
      t.integer :count

      t.timestamps
    end
  end
end
