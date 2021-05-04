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
  end
end

# validation tests/examples here

    # validates :name, presence: true
    # validates :price, presence: true
    # validates :quantity, presence: true
    # validates :category, presence: true
