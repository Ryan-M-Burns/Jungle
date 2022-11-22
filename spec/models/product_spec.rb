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

  end

  it 'is not valid without a price' do

  end

  it 'is not valid without a quantity' do

  end

  it 'is not valid without a category' do

  end
  
end
