class NotiMailer < ApplicationMailer
    default from: "gonggongjaewon@gmail.com"

    def noti_email(user)
        @user = user
        mail(to: @user.email, subject: "[멋사]마니또로부터 선물이 도착했습니다!! :D")
    end
end
