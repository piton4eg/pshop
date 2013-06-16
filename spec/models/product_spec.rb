require 'spec_helper'

describe Product do
  before do
		@product = Product.new(name: "Desc", description: "It is the Desc", image_url: "1.jpg", price: 10.00)
  end 
  subject { @product }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:image_url) }
  it { should respond_to(:price) }

  it { should be_valid }

  describe "with empty name" do
  	before { @product.name = " " }
  	it { should_not be_valid } 
  end
  describe "with short name" do
  	before { @product.name = "Des" }
  	it { should_not be_valid }
  end
  describe "with empty price" do
  	before { @product.price = 0.00 }
  	it { should_not be_valid }
  end
  describe "with minus price" do
  	before { @product.price = -10.00 }
  	it { should_not be_valid }
  end
  describe "with incorrect image url" do
  	it "should be invalid" do
  		invalid = %w{ fred.doc fred.gif/more fred.gif.more }
  		invalid.each do |image|
  			@product.image_url = image
  			expect(@product).not_to be_valid
  		end
  	end
  end
  describe "with correct image url" do
  	it "should be valid" do
  		valid = %w{ fred.jpg fred.png fred.gif }
  		valid.each do |image|
  			@product.image_url = image
  			expect(@product).to be_valid
  		end
  	end
  end
  describe "adding repeat product" do
  	before do
  		@sec_product = @product.dup
  		@sec_product.save
  	end 
  	it { should_not be_valid }
  end
end
