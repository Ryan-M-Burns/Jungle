require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before(:each) do
    @category = Category.new
    
    @product = Product.new( 
      name: "The Lion's Sword",
      price: 100,
      quantity: 1,
      category: @category
    )
    
  end
 # include multiple testing methods for future reference
 # test happy path for full Product instead of testing happy path for each attribute
  it 'is valid with valid attributes' do
    expect(@product.validate).to be true
    expect(@product.valid?).to be true
    expect(@product).to be_valid
    expect(@product.errors.full_messages.any?).to be false
  end

  # include multiple testing methods for future reference
  describe ".name" do
    it 'is not valid without a name' do
      @product.name = ''
      expect(@product.validate).to be false
      expect(@product.valid?).to be false
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include ("Name can't be blank")
      expect(@product.errors.full_messages[0]).to include ("can't be blank")
      expect(@product.errors.full_messages.any?).to be true
    end


  end

  describe ".price" do
    it 'is not valid when price is not a number' do
      @product.price = :NaN
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include ("Price is not a number")
    end

    it 'is not valid when price is not greater than 0' do
      @product.price = 0
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include ("Price must be greater than 0")
    end

    it 'is not valid when price is empty' do
      @product.price = :blank
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include ("Price is not a number")
    end
  end

  describe ".quantity" do    
    it 'is not valid when quantity is blank' do
      @product.quantity = :blank
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include ("Quantity can't be blank")
    end

    it 'is not valid when quantity is not a number' do
      @product.quantity = :NaN
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include ("Quantity is not a number")
    end
  end
  describe ".category" do
    it 'is not valid without a category' do
      @product.category = nil
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include ("Category must exist")
    end
  end
end
