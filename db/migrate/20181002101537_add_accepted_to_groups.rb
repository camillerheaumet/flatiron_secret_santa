class AddAcceptedToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :accepted?, :boolean
  end
end
