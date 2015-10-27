class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :tupdate]

  respond_to :html, :js

  def index
    @tickets = Ticket.all
    #p @tickets.inspect
    respond_with(@tickets)
  end

  def show
    respond_with(@ticket)
  end

  def new
    @ticket = Ticket.new
    # @ticket.test_a
    respond_with(@ticket)
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.save
    #respond_with(@ticket, :location => root_url)
    respond_with(@ticket, :location => trend_ticket_url(@ticket))
  end

  def update
    @ticket.update(ticket_params)
    respond_with(@ticket, :location => root_url)
  end

  def destroy
    @ticket.destroy
    respond_with(@ticket)
  end

  def tupdate
    @ticket = @ticket.update(ticket_params)
    respond_with(@ticket, :location => root_url)
  end

  def search
    if params[:q].nil?
      @tickets = []
    else
      @tickets = Ticket.search params[:q]
    end
  end

  def trend
    p params
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:title, :body, :team_id, :user_id, :status, :objective_id)
    end
end
