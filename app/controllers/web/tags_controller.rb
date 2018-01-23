module Web
	class TagsController < ApplicationController
		def index
			if params[:term]
				@tags = ActsAsTaggableOn::Tag.all
				render json: @tags
			end		
		end
	end
end
