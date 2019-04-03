class NotiMailer < ApplicationMailer
    default from: "gonggongjaewon@gmail.com"

    def noti_email(user)
        @user = user
        mail(to: @user.email, subject: "[멋사] 마니또로부터 선물이 도착했습니다!! :D")
    end

    def guess_email(user, guess)
        @user = user
        @guess = guess
        mail(to: @user.email, subject: "[멋사] 마니띠의 도전!?!?")
    end
end
