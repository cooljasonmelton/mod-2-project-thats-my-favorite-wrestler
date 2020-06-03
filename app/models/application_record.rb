class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  #get a random instance from class
  def self.random_sample
    self.all.sample
  end 

  #highest rating given
  def self.highest_rated_item
    self.all.max do |a, b|
        a.rating <=> b.rating
    end
  end 

  #use when someone deletes their profile to change all their favs to Jason's favs
  #can be altered to destroy their favs instead
  def self.clean_out_database
    self.all.each do |fav|
      if fav.user == nil
        fav.update(user_id: 1)
      end 
    end
  end


end
