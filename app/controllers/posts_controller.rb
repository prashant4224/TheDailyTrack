class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! #, :set_team, :set_plan, :set_phase, :set_objective
  #before_action :colect_posts

  respond_to :html, :js, :json

  def index
    p @teams
    @post = Post.new
    #@comment = Comment.new
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    p post_params
    @post = Post.new(post_params)
    @post.save
    respond_to do |format|
      format.html { redirect_to root_path}
    end
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    # def set_objective
    #   @objective = Objective.find(params[:objective_id])
    # end

    # def set_team
    #   @team = Team.find(params[:team_id])
    # end

    # def set_plan
    #   @plan = Plan.find(params[:plan_id])
    # end

    # def set_phase
    #   @phase = Phase.find(params[:phase_id])
    # end

    # def collect_teams
    #   @teams = Team.all
    # end

    def collect_posts
      @posts = Post.all
    end

    def 

    # def set_user
    #   @user = User.find(params[:id])
    # end

    def post_params
      params.require(:post).permit(:title, :user_id) #, :comments_attributes => [:body, :commentable_type, :commentable_id, :user_id] )
    end
end
