class InquiriesController < ApplicationController

  def index
    load_current_inquiries
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    inquiry = params[:inquiry]
    questions = inquiry[:questions]
    inquiry.delete( :questions )
    if new_inquiry = @current_user.inquiries.create( inquiry )
      # extract the items which have numeric keys
      questions.keys.detect { |k| questions[k] =~ /\d+/  }.each { |k| new_inquiry.questions.create( questions[k] ) }
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
