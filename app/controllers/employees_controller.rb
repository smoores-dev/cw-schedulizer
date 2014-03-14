class EmployeesController < ApplicationController
  before_action :signed_in_employee
  before_action :correct_employee, only: [:edit, :update]
  before_action :exec, only: [:index, :new, :destroy]

  def index
    @employees = Employee.paginate(page: params[:page], per_page: 15)
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:success] = "Employee added to the system."
      redirect_to new_employee_path
    end
    
  end

  def edit
  end

  def update
    if @employee.update_attributes(employee_params)
      flash[:success] = "Password updated"
    end
    render 'edit'
  end

  def destroy
    Employee.find(params[:id]).destroy
    flash[:success] = "Employee removed from system."
    redirect_to employees_url
  end

  private

    def employee_params
      params.require(:employee).permit(:name, :netID, :password, 
                                       :password_confirmation, :exec)
    end

    # Before filters

    def correct_employee
      @employee = Employee.find(params[:id])
      redirect_to(root_url) unless current_employee?(@employee)
    end

end
