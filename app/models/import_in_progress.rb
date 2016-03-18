require 'nkf'
class ImportInProgress < ActiveRecord::Base
  unloadable
  belongs_to :user
  belongs_to :project

  attr_accessible :user_id

end
