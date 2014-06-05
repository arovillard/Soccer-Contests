class CommentsController < InheritedResources::Base

  before_filter :load_contest
  before_action :authenticate_user!


  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to contest_games_path(@contest), notice: 'El comentario a sido agregado.' }
        format.json { render action: 'show', status: :created, location: @contest }
      else
        format.html { render action: 'new' }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_name, :contest_id, :body )
    end


end
