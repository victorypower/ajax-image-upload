class ImagesController < ResourceController::Base

	include RespondsToParent
	
	create.wants.html do
		responds_to_parent do
	      render :update do |page|
	        page['upload_form'].reset
	        page.insert_html :bottom, "images", :partial => @image
	        page.visual_effect :appear, "image[#{@image.id}]"
	        
	      end
	    end
	end
	
	destroy.wants.js
	
	private
	def collection
		@collection = Image.real
	end
end
