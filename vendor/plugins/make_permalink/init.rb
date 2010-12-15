# coding: utf-8
require 'make_permalink'

if Object.const_defined?("ActiveRecord")
  ActiveRecord::Base.send(:include, MakePermalink)
end
