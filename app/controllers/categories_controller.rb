class CategoriesController < ApplicationController

  def index
    @categories = Category.where(ancestry: nil)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @category = Category.find(params[:id])    
    if @category.has_children?
      @items = Item.where(status_id: 1, category_id: @category.descendant_ids.unshift(@category.id)) 
    else
      @items = @category.items.where(status_id: 1)
    end
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def get_size
    @size = Size.all
  end
end
