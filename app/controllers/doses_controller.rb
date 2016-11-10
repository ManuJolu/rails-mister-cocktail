class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.save
    redirect_to dose_path(@dose)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to doses_path
  end
end
