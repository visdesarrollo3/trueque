class Author < ActiveRecord::Base
  include Pacecar
  has_many :authorships
  has_many :books, :through => :authorships
  
  def titleized_name
    name.titleized
  end
end
