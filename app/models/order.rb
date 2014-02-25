class Order < ActiveRecord::Base
  validates_format_of  :email,  with: /.+@.+/ , :message => "has to be valid"
  validates :name, :presence => true
end
