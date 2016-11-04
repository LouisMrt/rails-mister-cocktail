class DosesController < ApplicationController
before_action :dose_params, only: [:create]

def index
   @doses = Doses.all
    end

  def show
  end

  def new
    @dose = Dose.new
  end

  def create
     @dose = Dose.create(dose_params)
     redirect_to doses_path
  end

  def update
   @dose.update(dose_params)
   redirect_to dose_path(@dose)
  end

  def edit
  end

    def destroy
    @dose.destroy
    redirect_to doses_path
    end

private

def set_dose
  @dose = Dose.find(params[:id])
end
def dose_params
  params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
end
end
end
