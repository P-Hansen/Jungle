class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  def index
    @categories = 5#Category.from(:name)
  end

  def create
    @category = Category.new(category_name)
  end
end
