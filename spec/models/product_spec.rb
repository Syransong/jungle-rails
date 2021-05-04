require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    context "given all 4 product fields: name, price, quantity and category" do
      it "saves successfully" do
        @category = Category.new
        @product = Product.new(
          name: "Mechanical Keyboard",
          price: 450.00,
          quantity: 7,
          category: @category
        )
        expect(@product).to be_valid
      end
    end

    context "given only 3 product fields: price, quantity and category" do
      it "should not save without a valid name" do
        @category = Category.new
        @product = Product.new(
          name: nil,
          price: 450.00,
          quantity: 7,
          category: @category
        )
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context "given only 3 product fields: name, quantity, category" do
      it "should not save without a valid price" do
        @category = Category.new
        @product = Product.new(
          name: "Mechanical Keyboard",
          price: nil,
          quantity: 7,
          category: @category
        )
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end

    context "given only 3 product fields: name, price, category" do
      it "should not save without a valid quantity" do
        @category = Category.new
        @product = Product.new(
          name: "Mechanical Keyboard",
          price: 450.00,
          quantity: nil,
          category: @category
        )
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context "given only 3 product fields: name, price, quantity" do
      it "should not save without a valid category" do
        @category = Category.new
        @product = Product.new(
          name: "Mechanical Keyboard",
          price: 450.00,
          quantity: 7,
          category: nil
        )
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end

