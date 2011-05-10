class ContactFormsController < ApplicationController
  skip_authorization_check
  def create
    @contact = ContactForm.new(params[:contact_form])
    if @contact.valid?
      ContactMailer.contact(@contact).deliver
      flash[:notice] = "Thanks! We've received your message. We'll get back to you really soon"
    else
      flash[:alert] = "There's been an error with your data. Please fill all the fields."
    end
    redirect_to root_url
  end

  def index
    @contact_form = ContactForm.new
  end

end
