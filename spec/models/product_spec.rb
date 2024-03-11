require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      @category = Category.create(name: 'New Category')
      @product = Product.new(
        name: 'Test',
        price: 24.99,
        quantity: 5,
        category: @category
      )
    end


    it "saves a product when all four fields are set" do
      expect(@product.save).to be true
    end


    it "must include a name" do
      @product.name = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end


    it "must include a price" do
      @product.price_cents = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end


    it "must include a category" do
      @product.category = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it "must include a quantity" do
      @product.quantity = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end


  end
end
