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

  it 'is valid with valid attributes' do
    expect(@product).to be_valid
  end

  it 'is not valid without a name' do
    @product.name = nil
    expect(@product).to be_valid
  end

  it 'is not valid without a price' do
    @product.price = ''
    expect(@product).to be_valid
  end

  it 'is not valid without a quantity' do
    @product.quantity = ''
    expect(@product).to be_valid
  end

  it 'is not valid without a category' do
    @product.category = nil
    expect(@product).to be_valid
  end

end
