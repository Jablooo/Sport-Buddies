class HomeController < ApplicationController

  def index
    @profiles = Profile.all
    @items = Item.all
    @item = if params[:search]
              Item.search(params[:search]).order("created_at DESC")
            else
              Item.all.order("created_at DESC")
            end
  end

  def messages
    @conversations = Conversation.all

    session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def conversation_item
    @conversation = Conversation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(
      :avatar,
      :first_name,
      :last_name,
      :sex,
      :DOB,
      :postcode,
      :user_id
    )
  end
  def item_params
    params.require(:item).permit(
      :photo,
      :name,
      :description,
      :selling_price,
      :quantity,
      :user_id,
      :category
    )
  end
  def conversation_params
    params.require(:conversation).permit(
      :recipient_id,
      :sender_id
    )
  end

end
