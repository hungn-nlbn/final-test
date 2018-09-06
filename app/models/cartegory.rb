class Cartegory < ApplicationRecord
	validates :name, :presence => true, :uniqueness => true
  	has_many :childrens, class_name: 'Cartegory', foreign_key: :parent_id
  	belongs_to :parent,  class_name: 'Cartegory', primary_key: :id
  	has_many :products, foreign_key: :parent_id, inverse_of: :cartegory
 private
 	def init
 		self.parent_id = 0 unless self.parent_id
 	end
end
