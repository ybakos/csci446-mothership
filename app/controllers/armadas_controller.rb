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
  end

end