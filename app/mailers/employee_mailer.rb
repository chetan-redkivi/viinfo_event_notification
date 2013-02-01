class EmployeeMailer < ActionMailer::Base
  default from: "forchetan01@gmail.com"

  def birthday_wish_email(employee)
    @employee = employee
    mail(:to => @employee.email, :subject => "Happy Birthday")
  end

  def birthday_notification_email(employee,person_names)
    set_banner_and_fb_twitter_image
    @employee = employee
    @birthday_person_name = person_names
    @url  = "http://example.com/login"
    mail(:to => @employee, :subject => "Today's Birthday")
  end

  def birthday_notification_error_email(employee,name,message)
    mail(:to => "forchetan01@gmail.com", :subject => "Error on birthday wishing")
  end

  def set_banner_and_fb_twitter_image
    banner_img = File.read(Rails.root.join('app/assets/images/bnr-img.jpg'))
    fb_img = File.read(Rails.root.join('app/assets/images/facebook-icon.png'))
    twitter_img = File.read(Rails.root.join('app/assets/images/twitter-icon.png'))

    attachments.inline['bnr-img.jpg'] = {
        :data => banner_img,
        :mime_type => "image/jpg",
        :encoding => "base64"
    }
    attachments.inline['facebook-icon.png'] = {
        :data => fb_img,
        :mime_type => "image/png",
        :encoding => "base64"
    }
    attachments.inline['twitter-icon.png'] = {
        :data => twitter_img ,
        :mime_type => "image/png",
        :encoding => "base64"
    }

  end


end
