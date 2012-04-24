class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save

      update_event_from_session
     

      if(@redirect_path)
        redirect_to @redirect_path
        return false
      end
      if admin?        
        redirect_to admin_path
        return false
#      else
#        puts "VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV"
#        puts current_user.inspect
#        puts current_user.role.inspect
#        puts current_user.role.name == 'admin'
#        xxxxx
      end
      flash[:notice] = "Successfully logged in."
      if(params[:invite_friend].to_i == 1 && params[:event_id].to_i > 0 )
        redirect_to contacts_user_path(current_user, :g_id=> params[:g_id], :e_id=>params[:event_id])
      end

      if current_user.role_id == 1
        #@id = UserCompanies.find_by_user_id(current_user.id)
        redirect_to :controller => "companies", :action => "dashboard"
      else
        redirect_to dashboard_path
      end
      
    else
      flash[:notice] = "We are unable to logged in."
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
end
