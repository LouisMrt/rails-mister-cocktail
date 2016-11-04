class CocktailsController < ApplicationController
before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
before_action :cocktail_params, only: [:create, :update]

def index
   @cocktails = Cocktail.all
    end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

 def create
    @cocktail = Cocktail.create(cocktail_params)
    flash[:notice] = "Your cocktail has been created"
    redirect_to cocktail_path(@cocktail)
  end

  def update
   @cocktail.update(cocktail_params)
   flash[:notice] = "Cocktail's recipe has ben updated"
   redirect_to cocktail_path(@cocktail)
  end

  def edit
  end

    def destroy
    @cocktail.destroy
    flash[:notice] = "Cocktail has been destroy"
    redirect_to cocktails_path
    end

private

def set_cocktail
  @cocktail = Cocktail.find(params[:id])
end
def cocktail_params
  params.require(:id).permit(:name, :image)
end
end
