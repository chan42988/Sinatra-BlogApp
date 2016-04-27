class CreateUsersTable < ActiveRecord::Migration
  def change

  	create_table :users do |t|
  		t.string		:username
  		t.string		:password
  		t.string		:fname
  		t.string		:lname
  		t.integer		:age
  		t.datetime	:birthday
  		t.string		:email
  		
  	end
  end
end
