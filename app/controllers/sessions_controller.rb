class SessionsController < ApplicationController

  def new
  end

  def create
    employee = Employee.find_by(netID: params[:session][:netID].downcase)
    if employee && employee.authenticate(params[:session][:password])
      sign_in employee
      redirect_back_or root_url
    else
      flash.now[:error] = 'Invalid netID/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
