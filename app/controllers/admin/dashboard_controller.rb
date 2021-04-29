class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  def show
    @product_count = Product.count(:products)
    @categories_count = Category.count(:name)
  end
end
