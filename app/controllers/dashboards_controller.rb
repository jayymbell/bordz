class DashboardsController < ApplicationController
  before_action :logged_in_user
  
  def show
    @assigned_tickets = Ticket.where(assigned_to: current_user.id).order(:project_id, :created_at)
    @reported_tickets = Ticket.where(reported_by: current_user.id).order(:project_id, :created_at)
  end
end
