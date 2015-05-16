class ObjectivesController < ApplicationController
  before_action :set_objective, only: [:show, :edit, :update, :destroy]
  before_action :set_team, :set_plan, :set_phase
  respond_to :html, :js

  def index
    @objectives = Objective.all
    respond_with(@objectives)
  end

  def show
    respond_with(@objective)
  end

  def new
    @objective = @phase.objectives.build
    respond_with(@objective)
  end

  def edit
  end

  def create
    @objective = @phase.objectives.new(objective_params)
    @objective.save
    respond_to do |format|
      format.html { redirect_to root_path}
    end
  end

  def update
    @objective.update(objective_params)
    respond_with(@objective)
  end

  def destroy
    @objective.destroy
    respond_with(@objective)
  end

  private
    def set_objective
      @objective = Objective.find(params[:id])
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

    def objective_params
      params.require(:objective).permit(:name, :description, :start_date, :end_date, :type, :phase_id)
    end
end
