class ItemsController < ApplicationController
  before_action :set_item, only: [:charges, :show, :edit, :update, :destroy]
  before_action :set_sports, only: [:new, :edit, :create, :update]
  before_action :sports_list_array, only: [:new, :edit, :create, :update]
  before_action :authenticate_user!

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    # @method = Stripe::Charge(current_user.stripe_id).method
  end

  # GET /items/new
  def new
    @item = Item.new

  end

  # GET /items/1/edit
  def edit; end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def charges
    # Amount in cents
    @amount = @item.selling_price*100

    # if current_user.stripe_id == nil

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount.to_i,
        :description => 'Rails Stripe customer',
        :currency    => 'aud'
      )
      current_user.stripe_id = customer.id
      current_user.save
    # else
    #   charge = Stripe::Charge.create(
    #     :customer    => current_user.stripe_id,
    #     :amount      => @amount.to_i,
    #     :description => 'Rails Stripe customer',
    #     :currency    => 'aud'
    #   )
    # end
  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to new_charge_path
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  def set_sports
    @sports = Sport.all
  end

  def sports_list_array
    @result = @sports.collect { |c| [ c ] }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(
      :user_id,
      :photo,
      :name,
      :description,
      :selling_price,
      :renting_price,
      :quantity,
      :category
    )
  end

  def sport_params
    params.require(:sport).permit(
      :name,
    )
  end
end
