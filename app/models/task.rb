class Task < ActiveRecord::Base
def self.list_tasks
find(:all, :order => "name" )
end
end
