class Image < ActiveRecord::Base
	has_attachment :content_type => :image, 
					:storage => :file_system, 
					:size => 0.kilobytes..1.megabytes,
					:resize_to => '320x200>',
					:thumbnails => { :small => '10x10>',
									 :thumb => '100x100>' }
					
	validates_as_attachment
	
	named_scope :real, :conditions => {:parent_id => nil}
end