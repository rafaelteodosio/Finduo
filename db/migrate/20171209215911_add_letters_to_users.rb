class AddLettersToUsers < ActiveRecord::Migration[5.1]
  def self.up
   change_table :users do |t|
     t.attachment :letter
   end
 end

 def self.down
   drop_attached_file :users, :letter
 end
end
