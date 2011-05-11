# encoding: UTF-8

class ContactFormsController < ApplicationController
  skip_authorization_check
  def create
    @contact = ContactForm.new(params[:contact_form])
    if @contact.valid?
      ContactMailer.contact(@contact).deliver
      flash[:notice] = "Tu mensaje ha sido enviado. Nos pondremos en contacto lo antes posible."
    else
      flash[:alert] = "Ha habido un error con tus datos. Por favor corrige la información e ingresa todos los campos."
    end
    redirect_to contact_forms_path
  end

  def index
    @contact_form = ContactForm.new
  end

end
