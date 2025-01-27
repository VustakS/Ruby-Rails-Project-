class CarsController < ApplicationController
  before_action :set_car, only: [:edit, :update, :destroy]

def index
    if params[:search].present? && params[:category_id].present?
      @cars = Car.joins(:categories).where("brands LIKE ? OR models LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
                  .where(categories: { id: params[:category_id] })
    elsif params[:search].present?
      @cars = Car.where("brand LIKE ? OR model LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    elsif params[:category_id].present?
      @cars = Car.joins(:categories).where(categories: { id: params[:category_id] })
    else
      @cars = Car.all
    end

    respond_to do |format|
      format.html
      format.json { render json: @cars }
    end
  end


  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to cars_path, notice: 'Samochód został dodany!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to cars_path, notice: 'Samochód został zaktualizowany!'
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path, notice: 'Samochód został usunięty!'
  end

  private

  def set_car
    @car = Car.find_by(id: params[:id])
    unless @car
      redirect_to cars_path, alert: 'Samochód nie istnieje!'
    end
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year, :price, category_ids: [])
  end
end
