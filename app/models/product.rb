class Product < ActiveRecord::Base
	validates :name, :description, :image_url, :price, presence: true	
	validates :name, length: { minimum: 4 }, uniqueness: { case_sensitive: false }
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\z}i,
		message: 'должно иметь один из форматов: GIF, JPG, PNG'
	}
end
