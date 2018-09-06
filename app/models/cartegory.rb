class Cartegory < ApplicationRecord
	validates :name, :presence => true, :uniqueness => true
  	has_many :childrens, class_name: 'Cartegory'
  	belongs_to :parent,  class_name: 'Cartegory'
  	has_many :products
  	before_save :init
 private
 	def init
 		self.parent_id = 0 unless self.parent_id
 	end
end
