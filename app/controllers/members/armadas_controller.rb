class Members::ArmadasController < Members::MembersController

  before_filter :find_armada

  ARMADAS_PER_PAGE = 20

  def create
    @armada = Armada.new(params[:armada])
    @armada.creator = current_user
    respond_to do |format|
      if @armada.save
        flash[:notice] = 'Armada was successfully created.'
        format.html { redirect_to members_armada_path(@armada) }
        format.xml  { render :xml => @armada, :status => :created, :location => @armada }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @armada.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @armada.destroy
        flash[:notice] = 'Armada was successfully destroyed.'        
        format.html { redirect_to members_armadas_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'Armada could not be destroyed.'
        format.html { redirect_to member_armada_path(@armada) }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  def index
    @armadas = Armada.paginate(:page => params[:page], :per_page => ARMADAS_PER_PAGE)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @armadas }
    end
  end

  def edit
  end

  def new
    @armada = Armada.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @armada }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @armada }
    end
  end

  def update
    respond_to do |format|
      if @armada.update_attributes(params[:armada])
        flash[:notice] = 'Armada was successfully updated.'
        format.html { redirect_to members_armada_path(@armada) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @armada.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

  def find_armada
    @armada = Armada.find(params[:id]) if params[:id]
  end

end