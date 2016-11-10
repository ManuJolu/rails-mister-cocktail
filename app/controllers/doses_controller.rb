class DosesController < ApplicationController
  before_action :find_cocktail, only: [:create, :edit, :update]
  def new
    @dose = Dose.new
  end

  def create
    @ingredient = Ingredient.find(params[:dose][:ingredient]) unless params[:dose][:ingredient].empty?

    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    @dose.ingredient = @ingredient

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def edit
  end

  def update
    @ingredient = Ingredient.find(params[:dose][:ingredient]) unless params[:dose][:ingredient].empty?

    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    @dose.ingredient = @ingredient
    @dose.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to @dose.cocktail
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
