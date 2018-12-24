class CreateHelpers < ActiveRecord::Migration[5.0]
  def change
    create_table :helpers do |t|
      t.string :content

      t.timestamps
    end
  end
end
