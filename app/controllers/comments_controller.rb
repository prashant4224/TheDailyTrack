class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_post

  respond_to :html, :js, :json
  # GET /comments
  # GET /comments.json
  def index
    load_all_comments
    #@comments = Comment.all
    @comment = Comment.new
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @post.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    load_all_comments
    @comment = @post.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.js
        format.html { redirect_to root_path, notice: 'Comment was successfully created.' }
        format.json
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_team
      @team = Team.find(params[:team_id])
    end

    def set_plan
      @plan = Plan.find(params[:plan_id])
    end

    def set_phase
      @phase = Phase.find(params[:phase_id])
    end
    
    def set_objective
      @objective = Objective.find(params[:objective_id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :commentable_type, :commentable_id, :user_id)
    end

    def set_holder_type_and_id
      
    end

    def load_all_comments
      @comments = Comment.all
    end
end
