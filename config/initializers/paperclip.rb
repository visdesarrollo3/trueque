Paperclip.options.merge!({
  :path => ":rails_root/public/uploads/:class-:attachment/:id/:style-:filename",
  :url => "/uploads/:class-:attachment/:id/:style-:filename"
})
