class MessagesController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource param_method: :can_san
  # load_and_authorize_resource :through => :current_user

  # GET /messages/new
  def new
    @message = current_user.messages.build
  end


  def create
    @status = Status.find(params[:status_id]) 
    @message = @status.messages.new(message_params)
    @message.user = current_user

 
      if @message.save
        redirect_to @status, notice: 'Message was successfully created.' 

      else
        redirect_to @status, notice: 'There was a problem.'
      end
    end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
      redirect_to @message.status, notice: 'Message was successfully destroyed.' 
  end


  private

    def message_params
      params.require(:message).permit(:content, :user_id, :status_id)
    end
    
    # def can_san
    #   params.require(:message).permit(:content, :user_id, :status_id)
    # end
end