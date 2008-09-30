class ImagesController < ResourceController::Base

	include RespondsToParent
	
	create.wants.html do
		responds_to_parent do
	      render :update do |page|
	        page.replace_html 'upload_form', :partial => 'upload_form', 
	        								 :locals => { :collection_url => collection_url },
	        								 :layout => false
	      end
	    end
	end
	
	private
	def collection
		@collection = Image.real
	end
end
