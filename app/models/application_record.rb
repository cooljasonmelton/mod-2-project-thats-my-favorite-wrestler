class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.random_sample
    self.all.sample
  end 






end
