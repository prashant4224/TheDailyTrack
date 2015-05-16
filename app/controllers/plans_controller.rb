class PlansController < ApplicationController
  before_action :set_team
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  respond_to :html, :js

  def index
    @plans = Plan.all
    respond_with(@plans)
  end

  def show
    respond_with(@plan)
  end

  def new
    @plan = @team.plans.build
    respond_with(@plan)
  end

  def edit
  end

  def create
    @plan = @team.plans.new(plan_params)
    @plan.save
    respond_to do |format|
      format.html { redirect_to root_path}
    end
  end

  def update
    @plan.update(plan_params)
    respond_with(@plan)
  end

  def destroy
    @plan.destroy
    respond_with(@plan)
  end

  private
    def set_plan
      @plan = Plan.find(params[:id])
    end

    def set_team
      @team = Team.find(params[:team_id])
    end

    def plan_params
      params.require(:plan).permit(:name, :description, :start_date, :end_date, :team_id)
    end
end
