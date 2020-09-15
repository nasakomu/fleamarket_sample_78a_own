class CategoriesController < ApplicationController

  def index
    @categories = Category.where(ancestry: nil)
  end

  def show
    @category = Category.find(params[:id])
    # @items = @category.items
  end

end
