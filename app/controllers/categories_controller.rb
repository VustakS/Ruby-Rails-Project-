class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @categories = Category.where("name LIKE ?", "%#{params[:search]}%")
    else
      @categories = Category.all
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Kategoria została dodana!'
    else
      render :new
    end
  end

  def show
    @cars = @category.cars
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to category_path(@category), notice: 'Kategoria została zaktualizowana!'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Kategoria została usunięta!'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
