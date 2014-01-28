class TestimonialsController < ApplicationController
  before_action :exec, only: [:new, :create, :destroy]

  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)
    if @testimonial.save
      flash[:success] = "Testimonial added"
    end
    redirect_to testimonials_path
  end

  def destroy
    Testimonial.find(params[:id]).destroy
    flash[:success] = "Testimonial deleted"
    redirect_to testimonials_path
  end

  def index
    @testimonials = Testimonial.all
  end

  private

    def testimonial_params
      params.require(:testimonial).permit(:content, :author)
    end

end
