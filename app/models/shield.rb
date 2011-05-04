class Shield < ActiveResource::Base

  self.site = INTEGRATION_CONFIG[Rails.env]['shield']['endpoint_url']

  def image_path
    base = INTEGRATION_CONFIG[Rails.env]['shield']['image_base_url']
    "#{base}/#{id}/thumb.png"
  end

end