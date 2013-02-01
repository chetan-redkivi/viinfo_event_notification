class HomeController < ApplicationController
  def index
    EmployeeMailer.birthday_notification_email("forchetan01@gmail.com",@names).deliver
  end
end
