class HomeController < ApplicationController

  def index
    @profiles = Profile.all
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:item).permit(
      :avatar,
      :first_name,
      :last_name,
      :sex,
      :DOB,
      :postcode,
      :user_id
    )
  end
end
