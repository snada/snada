class UserSessionsController < ApplicationController
  before_filter :require_authentication, only: :destroy

  def create
    auth = request.env['omniauth.auth']
    if !auth
      render(file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false) and return
    end

    u = User.find_by(github_uid: auth.uid) || User.create(nickname: auth.info.nickname, role: 0, github_uid: auth.uid, github_avatar: auth.info.image, github_url: auth.info.urls.GitHub)

    UserSession.create(u)
    redirect_to root_path
  end

  def destroy
    current_user_session.destroy
    redirect_to root_path
  end
end
