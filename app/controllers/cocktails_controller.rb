class CocktailsController < ApplicationController
  before_action :find_cocktails, only: [:show, :edit, :destroy, :update]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @ingredients = Ingredient.ordered
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render 'cocktails/new'
    end
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def find_cocktails
    @cocktail = Cocktail.find(params[:id])
  end
end
