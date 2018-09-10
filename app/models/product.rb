class Product < ApplicationRecord
	validates :name, :presence => true, :uniqueness => true
	validates :price, :numericality => {:greater_than => 0.0}
	belongs_to :cartegory, :foreign_key => :parent_id, inverse_of: :products
	def self.search(search)
  		where("name LIKE ? OR parent_id LIKE ? OR price LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
	end
end
