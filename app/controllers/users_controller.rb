class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_the_user, only: [:show]
  

	def index
	  @uers = User.all
	end


  def show
  end
  
  
    private
    
    def set_the_user
      @user = User.find_by(username: params[:id])
    end
end
