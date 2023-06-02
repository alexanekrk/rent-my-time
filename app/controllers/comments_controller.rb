class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @pigeon = Pigeon.find(params[:pigeon_id])
    @comment.pigeon = @pigeon
    @comment.save
    redirect_to pigeon_path(@pigeon)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
