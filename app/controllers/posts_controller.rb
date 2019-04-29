class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @received_hints = Post.where(user_id: current_user.manito, show: true).where("mission like ?", "힌트%")
        @received_missions = Post.where(user_id: current_user.manito, show: true).where("mission like ?", "미션%")
        @sent_hints = Post.where(user_id: current_user.id, show: true).where("mission like ?", "힌트%")
        @sent_missions = Post.where(user_id: current_user.id, show: true).where("mission like ?", "미션%")
        @submitted_posts = Post.where(user_id: current_user.id, show: nil)
        @received_posts = Post.where(user_id: current_user.manito, show: true)
        @sent_posts = Post.where(user_id: current_user.id, show: true)
    end

    def new
        @post = Post.new
    end

    def create
        case params[:mission]
        when "hint1"
            mission = "힌트1: 마니띠 첫인상 (손글씨)"
        when "hint2"
            mission = "힌트2: 마니띠 얼굴 그리기"
        when "hint3"
            mission = "힌트3: 나에 대한 신박한 사실 한 가지"
        when "hint4"
            mission = "힌트4: 나의 애장품 사진"
        when "mission1"
            mission = "미션1: 함께 <코딩> 인증샷"
        when "mission2"
            mission = "미션2: 함께 <식사> 인증샷"
        when "mission3"
            mission = "미션3: 세미나에 지친 마니띠에게 간식과 쪽지를 (2000원 이하)"
        when "mission4"
            mission = "미션4: 주황 or 검정 선물 (3000원 이하)"
        when "mission5"
            mission = "미션5: 하이파이브/악수/새끼손가락 약속/팔씨름"
        when "mission6"
            mission = "미션6: 세상에서 가장 쓸데없는 선물 (5000원 이하)"
        when "mission7"
            mission = "미션7: 마니띠와 짠! (술일 필요는 X)"
        when "mission8"
            mission = "미션8: 칭찬 세 가지가 담긴 손편지"
        end

        # p = Post.create(mission: mission, user_id: current_user.id, content: params[:content], show: params[:show], photo: params[:photo])
        @post = Post.new(post_params)
        if @post.save!
            @post.mission = mission
            @post.content = params[:content]
            @post.show = params[:show]
            @post.save!
            if(!@post.show.nil?)
                NotiMailer.noti_email(@post.user.manitee).deliver_now
            end            
            redirect_to action: 'index'
        else
            render :new
        end
    end

    def destroy
        post_id = params[:id]
        Post.destroy(post_id)

        redirect_to action: 'index'
    end
    
    def create_comment
        post_id = params[:id]
        content = params[:content]

        post = Post.find(post_id)
        Comment.create(content: content, post_id: post_id, user_id: current_user.id)

        # redirect_to action: 'index'
        # render json: {}
        redirect_to request.referrer
    end

    def destroy_comment
        comment_id = params[:comment_id]
        Comment.destroy(comment_id)

        # redirect_to action: 'index'
        # render json: {}
        redirect_to request.referrer
    end

    def create_reply
        Reply.create(comment_id: params[:id], content: params[:content])
    end

    def admin
    end

    def guess
    end

    def match
        u = current_user
        u.try = u.try - 1
        u.save

        g = Guess.create(user_id: current_user.id, content: params[:content])
        NotiMailer.guess_email(current_user.manito, g.content).deliver_now

        if params[:content] == current_user.manito.username
            @message = "맞았습니다!!! 훌륭해요!!"
            u.guessed = true
            u.save
        else
            if u.try > 0
                @message = "틀렸습니다!! 다시 도전해보세요~"
            end
        end
        render 'guess'
    end

    def results
        @alphabetic = [nil, 20, 16, 25, 15, 1, 12, 3, 2, 14, 27, 26, 23, 9, 17, 13, 5, 7, 10, 6, 19, 30, 28, 22, 4, 24, 8, 29, 11, 18, 21]

        @coffee = Array.new(31, 0)
        @bap = Array.new(31, 0)

        @balgak = [nil]
        (1..30).each do |i|
            if User.find(i).manitee.guessed
                @balgak.push(true)
                @bap[i] = @bap[i] + 1
            else
                @balgak.push(false)
            end
        end

        @hint = [nil]
        (1..30).each do |i|
            u = User.find(i)
            if ((u.posts.exists?(['mission LIKE ?', "힌트1%"])) && (u.posts.exists?(['mission LIKE ?', "힌트2%"])) &&
                (u.posts.exists?(['mission LIKE ?', "힌트3%"])) && (u.posts.exists?(['mission LIKE ?', "힌트4%"])))
                @hint.push(true)
            else
                @hint.push(false)
                @coffee[i] = @coffee[i] + 1
            end
        end

        @mission_boolean = [nil]
        @mission_number = [nil]
        (1..30).each do |i|
            u = User.find(i)
            count = 0
            if (u.posts.exists?(['mission LIKE ?', "미션1%"])) 
                count += 1  
            end
            if (u.posts.exists?(['mission LIKE ?', "미션2%"])) 
                count += 1 
            end
            if (u.posts.exists?(['mission LIKE ?', "미션3%"])) 
                count += 1 
            end
            if (u.posts.exists?(['mission LIKE ?', "미션4%"])) 
                count += 1 
            end
            if (u.posts.exists?(['mission LIKE ?', "미션5%"])) 
                count += 1 
            end
            if (u.posts.exists?(['mission LIKE ?', "미션6%"])) 
                count += 1 
            end
            if (u.posts.exists?(['mission LIKE ?', "미션7%"])) 
                count += 1 
            end
            if (u.posts.exists?(['mission LIKE ?', "미션8%"])) 
                count += 1 
            end

            @mission_number.push(count)
            if count >= 4
                @mission_boolean.push(true)
            elsif count > 1
                @mission_boolean.push(false)
                @coffee[i] = @coffee[i] + 1
            else
                @mission_boolean.push(false)
                @bap[i] = @bap[i] + 1
            end
        end
    end

    private
        def post_params
            params.require(:post).permit(:id, :user_id, :mission, :content, :show, :photo)
        end
end
