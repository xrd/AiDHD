class InquiriesController < ApplicationController

  def index
    load_current_inquiries
  end

  def show
    @inquiry = @current_user.inquiries.find( params[:id] )
  end

  def new
    @inquiry = Inquiry.new
  end

  def destroy
    @inquiry = @current_user.inquiries.find( params[:id])
    @inquiry.destroy if @inquiry
    render :layout => false
  end

  def create
    inquiry = params[:inquiry]
    questions = inquiry[:questions]
    puts "Questions: #{questions.inspect}"
    inquiry.delete( :questions )
    if new_inquiry = @current_user.inquiries.create( inquiry )
      # extract the items which have numeric keys
      questions.keys.each do |key|
        if key =~ /\d+/
          puts "Question: #{questions[key]}"
          new_inquiry.questions.create( questions[key] )
        end
      end
      redirect_to inquiries_path()
    else
      render :new
    end
  end


  private
  def load_current_inquiries
    @current_inquiries = @current_user.inquiries #.current
  end
end
