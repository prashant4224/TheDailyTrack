class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @team = Team.new
    @plan = @team.plans.new
    respond_with(@teams)
  end

  def show
    UserMailer.delay.profile_email(current_user)
    respond_with(@team)
  end

  def new
    @team = Team.new
    respond_with(@team)
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    @team.save
    UserMailer.profile_email(current_user).deliver
    respond_with(@team)
  end

  def update
    @team.update(team_params)
    respond_with(@team)
  end

  def destroy
    @team.destroy
    respond_with(@team)
  end

  def search
    if params[:q].nil?
      @teams = []
    else
      @q = Team.ransack params[:q]
      p @team_list = @q.result.includes(:plans)
    end
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :description) #, plans_attributes: [:name, :description, :start_date, :end_date, :team_id])
    end
end
