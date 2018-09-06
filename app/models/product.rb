class Product < ApplicationRecord
	validates :name, :presence => true, :uniqueness => true
	validates :price, :numericality => {:greater_than => 0.0}
	belongs_to :cartegory, class_name: "Cartegory"
end
