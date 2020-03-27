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


  #highest average rating from favorite
  #return an id with the highest average rating
  # def self.highest_average_rating
  #   self.all.max do |a, b|
  #     a.where(wrestler_id: a.wrestler_id).average(:rating) <=> b.where(wrestler_id: b.wrestler_id).average(:rating)
  #   end 

     




  # end 










end
