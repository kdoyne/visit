class VisitorsController < ApplicationController

  def index
    @current_user = current_user
    @visitors = Visitor.all
  end

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(visitor_params)
    if @visitor.save
      session[:visitor_id] = @visitor.id
      redirect_to root_path
    else
      render(:new)
    end
  end


private

  def visitor_params
    params.require(:visitor).permit(:first_name, :last_name, :email, :company)
  end

end

