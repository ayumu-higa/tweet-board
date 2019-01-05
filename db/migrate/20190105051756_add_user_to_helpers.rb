class AddUserToHelpers < ActiveRecord::Migration[5.0]
  def change
    add_reference :helpers, :user, foreign_key: true
  end
end
