require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    subject(:cat) { Category.new(name: "testing") }

    subject(:prod) { Product.new(
      name: "that book",
      description: "you know the one",
      category_id: cat.id,
      quantity: 15,
      price: 60
      ) }

    it "can create a new category with the right name" do
      expect(cat.name).to eq "testing"
    end

    it "can create a new product with a name" do
      expect(prod.name).to eq "that book"
    end

    it "can create a new product with a description" do
      expect(prod.description).to eq "you know the one"
    end

    it "can create a new product with a price" do
      expect(prod.price).to eq 60
    end

    it "can create a new product with a quantity" do
      expect(prod.quantity).to eq 15
    end

    it "can create a new product with a category" do
      expect(prod.category_id).to eq cat.id
    end

  end
end