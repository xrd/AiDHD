class InquiriesController < ApplicationController

  def index
    load_current_inquiries
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    debugger
    inquiry = params[:inquiry]
    if @current_user.inquiries.create inquiry
      redirect_to inquiries_path()
    else
      render :new
    end
  end


  private
  def load_current_inquiries
    @current_inquiries = @current_user.inquiries.current
  end
end
