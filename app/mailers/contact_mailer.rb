class ContactMailer < ActionMailer::Base
  default :to   => "actividadculturalbiblioteca@eafit.edu.co"
  default :bcc  => "nhock@zinergia.co"
  
  def contact(contact)
    @contact = contact
    subject = "[Trueque Literario] #{@contact.name} ha enviado un mensaje!"
    mail(:subject => subject, :from => "#{@contact.name} <#{@contact.email}>")
  end
end