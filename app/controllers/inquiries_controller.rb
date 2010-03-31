class InquiriesController < ApplicationController

  def index
    load_current_inquiries
  end

  def new
    inquiry = Inquiry.new
  end

  def create
  end


  private
  def load_current_inquiries
    @current_inquiries = @current_user.inquiries.current
  end
end
