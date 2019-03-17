class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
        @received_hints = Post.where(user_id: current_user.manito).where("mission like ?", "힌트%")
        @received_missions = Post.where(user_id: current_user.manito).where("mission like ?", "미션%")
        @sent_hints = Post.where(user_id: current_user.id, show: true).where("mission like ?", "힌트%")
        @sent_missions = Post.where(user_id: current_user.id, show: true).where("mission like ?", "미션%")
        @submitted_posts = Post.where(user_id: current_user.id, show: nil)
        @received_posts = Post.where(user_id: current_user.manito)
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
            mission = "힌트1: 마니띠 첫인상 (손글씨)"
        when "hint3"
            mission = "힌트1: 마니띠 첫인상 (손글씨)"
        when "hint4"
            mission = "힌트1: 마니띠 첫인상 (손글씨)"
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
        if @post.save
            @post.mission = mission
            @post.content = params[:content]
            @post.show = params[:show]
            @post.save
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
        Comment.create(content: content, post_id: post_id)

        # redirect_to action: 'index'
        render json: {}
    end

    def destroy_comment
        comment_id = params[:comment_id]
        Comment.destroy(comment_id)

        render json: {}
    end

    def create_reply
        Reply.create(comment_id: params[:id], content: params[:content])
    end

    private
        def post_params
            params.require(:post).permit(:id, :user_id, :mission, :content, :show, :photo)
        end
end
