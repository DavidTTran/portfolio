class CreateOauths < ActiveRecord::Migration[6.0]
  def change
    create_table :oauths do |t|
      t.references :user, null: false, foreign_key: true
      t.string :provider
      t.string :url

      t.timestamps
    end
  end
end
