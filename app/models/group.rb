class Group < ApplicationRecord
  has_many :invitations
  has_many :users, through: :invitations





  #Step 1
  #Capture emails via form

  #Step 2
  #send email to people

  #Step 3
  #Write an if statement to check if all invited users have accepted their invitation

  #Step 4
  #make random draw




  def random_match
  end


end
