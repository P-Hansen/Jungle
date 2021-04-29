class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  
  def index
    @category_count = Category.count(:name)
    @category_names = Category.select(:name)
    @category = Category.new
  end

  # def new
  #   @category = Category.new
  # end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      render :index
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
