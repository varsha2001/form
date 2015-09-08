class FormfillsController < ApplicationController
 

	def new
    @formfill = Formfill.new
  end
def index
    @formfills = Formfill.all
  end
  def show
    @formfill = Formfill.find(params[:id])
  end



   
  def create
    @formfill = Formfill.new(formfill_par)
    mod_interest = params["formfill"]["interest"].join(",") if params["formfill"]["interest"].present?
    @formfill.interest = mod_interest
    if @formfill.save
      redirect_to action: :index
    else
      render 'new'
    end
  end

 
  def update
    @formfill = Formfill.find(params[:id])
 
    if @formfill.update(formfill_par)
      redirect_to action: :index
    else
      render 'edit'
    end
  end

  def edit
    @formfill = Formfill.find(params[:id])
  end

  def destroy
    @formfill = Formfill.find(params[:id])
    @formfill.delete
 
    redirect_to formfills_path
  end
  private
    def formfill_par
      params.require(:formfill).permit(:firstname,:lastname,:email,:address,:gender,:city,:state,:country,:interest)
    end
end
