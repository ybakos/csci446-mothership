class Fighter < ActiveResource::Base

  self.site = INTEGRATION_CONFIG[Rails.env]['fighter']['endpoint_url']

  def image_path
  	if self.photo_file_name.nil?
      INTEGRATION_CONFIG[Rails.env]['fighter']['image_default_url']
	else
	  extension = File.extname(self.photo_file_name)
	  base = INTEGRATION_CONFIG[Rails.env]['fighter']['image_base_url']
	  "#{base}/#{id}/thumb#{extension}"
    end
  end

end