class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.bcc} - #{message.subject}"
    message.to      = "nhock@zinergia.co"
    message.bcc     = ""
  end
end