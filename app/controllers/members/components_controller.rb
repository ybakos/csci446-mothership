class Members::ComponentsController < Members::MembersController

  before_filter :load_armada

  def index
    if params[:resource_name]
      @components = params[:resource_name].constantize.find(:all)
    else
      @components = []
    end
  end

  def create
    @component = Component.new(params[:component])
 
    respond_to do |format|
      if @component.save
        flash[:notice] = 'Component was successfully created.'
        format.html { redirect_to members_component_path(@component) }
        format.xml  { render :xml => @component, :status => :created, :location => @component }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @component.destroy
        flash[:notice] = 'Component was successfully destroyed.'        
        format.html { redirect_to members_components_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'Component could not be destroyed.'
        format.html { redirect_to member_component_path(@component) }
        format.xml  { head :unprocessable_entity }
      end
    end
  end



  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @component }
    end
  end

  def update
    respond_to do |format|
      if @component.update_attributes(params[:component])
        flash[:notice] = 'Component was successfully updated.'
        format.html { redirect_to members_component_path(@component) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  end

  private

    def load_armada
      @armada = Armada.find(params[:armada_id]) if params[:armada_id]
    end

end