class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_sports, only: [:new, :edit, :create, :update]
  before_action :authenticate_user! # devise method authenticate user!

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @buddy_list = current_user.buddy_list
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    # puts "profile_params: #{profile_params[:sport_ids]}"

    respond_to do |format|
      begin
        if current_user != @profile.user
          performing_follow?
          @profile.user.toggle_followed_by(current_user)
          # the next two lines are all about the redirecting or the 'resheshing' of a page so that you can see the result of follow and unfollow without having to refresh.
          format.html { redirect_to @profile.user }
          format.json { render :show, status: :ok, location: @profile }
        end

        @profile.update(profile_params)
        # add skill objects and save to db
        # profile_params[:sport_ids].each do |sport_id|
        #   Skill.create!(profile_id: @profile.user.id, sport_id: sport_id)
        # end
        format.html { redirect_to profile_url, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      rescue
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profile_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = if params[:id]
               Profile.find_by!(user_id: params[:id])
             else
               Profile.find_by(user: current_user)
             end
  end

  def set_sports
    @sports = Sport.all
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(
      :user_id,
      :avatar,
      :first_name,
      :last_name,
      :sex,
      :DOB,
      :street,
      :postcode,
      :state,
      :country,
      :latitude,
      :longitude,
      :name,
      :sport => []
    )
  end

  def sport_params
    params.require(:sport).permit(
      :name,
    )
  end

  def performing_follow?
  params.require(:user)[:toggle_follow].present?
  end
end
