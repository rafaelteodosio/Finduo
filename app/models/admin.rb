class Admin < ActiveRecord::Base
  devise :database_authenticatable, :trackable, :timeoutable
  acts_as_commontator
end
