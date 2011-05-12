class ArmadasController < ApplicationController

  ARMADAS_PER_PAGE = 20

  def index
    @armadas = Armada.paginate(:page => params[:page], :per_page => ARMADAS_PER_PAGE)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @armadas }
    end
  end

  def show
    @armada = Armada.find(params[:id]) if params[:id]
    respond_to do |format|
      format.html
      format.xml  { render :xml => @armada }
    end
    #rescue
    #  flash[:error] = "Sorry, could not connect to remote component services."
    #  redirect_to root_url
  end

end