class PhasesController < ApplicationController
  before_action :set_phase, only: [:show, :edit, :update, :destroy]
  before_action :set_team, :set_plan
  respond_to :html, :js

  def index
    @phases = Phase.all
    respond_with(@phases)
  end

  def show
    respond_with(@phase)
  end

  def new
    @phase = @plan.phases.build
    respond_with(@phase)
  end

  def edit
  end

  def create
    @phase = @plan.phases.new(phase_params)
    @phase.save
    respond_to do |format|
      format.html { redirect_to root_path}
    end
  end

  def update
    @phase.update(phase_params)
    respond_with(@phase)
  end

  def destroy
    @phase.destroy
    respond_with(@phase)
  end

  private
    def set_phase
      @phase = Phase.find(params[:id])
    end

    def set_team
      @team = Team.find(params[:team_id])
    end

    def set_plan
      @plan = Plan.find(params[:plan_id])
    end

    def phase_params
      params.require(:phase).permit(:name, :description, :start_date, :end_date, :plan_id)
    end
end
