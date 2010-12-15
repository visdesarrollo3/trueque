module StoreAttachmentOnS3
  def has_attached_file(name, options = {})
    options[:storage] ||= :s3
    options[:path]    ||= ":attachment/:id/:style-:filename"
    options[:bucket]  ||= ENV["S3_BUCKET"]
    options[:s3_credentials] ||= {
                                    :access_key_id => ENV['S3_KEY'],
                                    :secret_access_key => ENV['S3_SECRET']
                                 }
    super(name, options)
  end
end