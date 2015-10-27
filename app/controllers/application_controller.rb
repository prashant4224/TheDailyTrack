class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, :load_teams, :load_tickets
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :sign_in_user

  protected

  def sign_in_user
  	@user ||= current_user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :name, :last_name, :dob, :avatar, :gender, :terms_of_service]
  end

  def load_teams
    @teams = Team.includes(plans: [phases: [objectives: [:tickets]]])
  end

  def load_tickets
     @ticket_pending = Ticket.where(status: 'pending')
     @ticket_inprogress = Ticket.where(status: 'in_progress')
     @ticket_completed = Ticket.where(status: 'completed')
  end

end