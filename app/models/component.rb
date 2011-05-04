class Component < ActiveRecord::Base

  belongs_to :armada

  attr_accessor :resource

  def after_initialize
  	@resource = self.resource_name.constantize.find(self.iid)
  end

  def to_s
    @resource.name
  end


end
