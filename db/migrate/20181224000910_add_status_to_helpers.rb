class AddStatusToHelpers < ActiveRecord::Migration[5.0]
  def change
    add_column :helpers, :status, :string
  end
end
