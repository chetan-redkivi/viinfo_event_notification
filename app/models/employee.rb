class Employee < ActiveRecord::Base
  attr_accessible :date_of_birth, :email, :mobile_number, :name, :status
end
