class CommentsController < ApplicationController
	before_action :set_post
	load_and_authorize_resource param_method: :comment_params

	def create
		@comment = Comment.new(comment_params)
		@comment.user = current_user
		@comment.post = @post
		@comment.save
		redirect_to @post
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to @post
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def set_post
		@post = Post.find(params[:post_id])
	end

end
