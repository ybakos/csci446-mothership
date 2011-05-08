class Members::ComponentsController < Members::MembersController

  before_filter :load_armada

  def index
    if params[:resource_name]
      @components = params[:resource_name].constantize.find(:all)
    else
      @components = []
    end
  rescue
    flash.now[:error] = "Sorry. Could not connect to remote service for #{params[:resource_name]}."
      @components = []
  end

  def create
puts "########################## about to create component!"
    @component = @armada.components.new(:iid => params[:resource_id], :resource_name => params[:resource_name])
puts "########################## created component!"
    respond_to do |format|
      if @component.save
        flash[:notice] = "Component was successfully added to <a href=\"/members/armadas/#{@armada.id}\">your armada</a>."
        format.html { redirect_to members_armada_components_path(@armada) }
        format.xml  { render :xml => @component, :status => :created, :location => @component }
      else
        flash[:error] = 'Could not add component to your armada.'
        format.html { redirect_to members_components_path}
        format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  rescue
    flash[:error] = "Sorry. Could not connect to remote service for #{params[:resource_name]}."
    redirect_to members_armada_components_url(@armada)
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
