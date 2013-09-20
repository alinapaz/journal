class AddUserRefToEntries < ActiveRecord::Migration
  def change
    add_reference :entries, :user, index: true

    # if there are already existing entries...
    if Entry.count > 0
      # find the first user that was created.
      user = User.first

      # If there aren't any users...  
      unless user
        # create a placeholder user.
        user = User.create :email => 'placeholder@placeholder.com', :password => 'changeme'
      end

      # Then find each entry...
      Entry.find_each do |entry|
        # and assign the previously found/created user to be the user (author) of that entry.
        entry.user = user
        entry.save!
      end
    end
  end
end
