class CreateInvitedUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :invited_users do |t|
      t.integer :group_id
      t.string :email

      t.timestamps
    end
  end
end
