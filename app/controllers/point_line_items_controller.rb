class PointLineItemsController < ApplicationController
  before_action :set_point_line_item, only: [:show, :edit, :update, :destroy]

  # GET /point_line_items
  # GET /point_line_items.json
  def index
    @point_line_items = PointLineItem.all
  end

  # GET /point_line_items/1
  # GET /point_line_items/1.json
  def show
  end

  # GET /point_line_items/new
  def new
    @point_line_item = PointLineItem.new
  end

  # GET /point_line_items/1/edit
  def edit
  end

  # POST /point_line_items
  # POST /point_line_items.json
  def create
    @point_line_item = PointLineItem.new(point_line_item_params)

    respond_to do |format|
      if @point_line_item.save
        format.html { redirect_to @point_line_item, notice: 'Point line item was successfully created.' }
        format.json { render :show, status: :created, location: @point_line_item }
      else
        format.html { render :new }
        format.json { render json: @point_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /point_line_items/1
  # PATCH/PUT /point_line_items/1.json
  def update
    respond_to do |format|
      if @point_line_item.update(point_line_item_params)
        format.html { redirect_to @point_line_item, notice: 'Point line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @point_line_item }
      else
        format.html { render :edit }
        format.json { render json: @point_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_line_items/1
  # DELETE /point_line_items/1.json
  def destroy
    @point_line_item.destroy
    respond_to do |format|
      format.html { redirect_to point_line_items_url, notice: 'Point line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def expire
    PointExpirer.new.expire(Time.zone.now)
    redirect_to :back, notice: "Points expired"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_line_item
      @point_line_item = PointLineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_line_item_params
      params.require(:point_line_item).permit(:user_id, :points, :source)
    end

end
