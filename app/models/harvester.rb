class Harvester < ActiveResource::Base

  self.site = INTEGRATION_CONFIG[Rails.env]['harvester']['endpoint_url']

  def image_path
  	if self.photo_file_name.nil?
      INTEGRATION_CONFIG[Rails.env]['harvester']['image_default_url']
	else
	  extension = File.extname(self.photo_file_name)
	  base = INTEGRATION_CONFIG[Rails.env]['harvester']['image_base_url']
	  "#{base}/#{id}/icon/#{self.photo_file_name}"
    end
  end

end