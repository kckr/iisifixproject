class CommentsController < ApplicationController
  before_action :set_conversable
  def create
    if Comment.create(comments_params)
      flash[:notice] = t('.notice')
      redirect_back fallback_location: @conversable
    else
      flash[:error] = t('.error')
      redirect_back
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:message).merge(
        {
          sender_id: current_user.id,
          receiver_id: get_receiver_id,
          conversation_id: params[:conversation_id]
        })
  end

  def get_receiver_id
    if current_user.garage_owner?
      @conversable.vehicle_owner.id
    elsif current_user.vehicle_owner?
      @conversable.garage_owner.id
    end
  end

  def set_conversable
    @conversable = Conversation.find(params[:conversation_id]).conversable
  end
end
