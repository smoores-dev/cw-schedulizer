module SessionsHelper

  def sign_in(employee)
    remember_token = Employee.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    employee.update_attribute(:remember_token, Employee.encrypt(remember_token))
    self.current_employee = employee
  end

  def signed_in?
    !current_employee.nil?
  end

  def current_employee=(employee)
    @current_employee = employee
  end

  def current_employee
    remember_token = Employee.encrypt(cookies[:remember_token])
    @current_employee ||= Employee.find_by(remember_token: remember_token)
  end

  def current_employee?(employee)
    employee == current_employee
  end

  def signed_in_employee
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in"
    end
  end

  def sign_out
    current_employee.update_attribute(:remember_token, Employee.encrypt(Employee.new_remember_token))
    cookies.delete(:remember_token)
    self.current_employee = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
