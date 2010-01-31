class Task < ActiveRecord::Base
  def self.up
  
   create_table :task do |t|
   end
  end
  
  def self.down
  
  drop_table :task
  end
end

