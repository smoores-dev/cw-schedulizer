class TestController < ApplicationController
  before_action :signed_in_employee

  def create
    @test = Test.new(testing_params)
  end

  def edit
  end

  def update
    if Test.find(1).update_attributes(testing_params)
      flash[:success] = "Testing status updated"
    end
    redirect_to edit_test_path(Test.find(1))
  end

  private

    def testing_params
      params.require(:test).permit(:link, :testingPeriod)
    end

end
