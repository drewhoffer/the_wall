class BricksController < ApplicationController
  before_action :set_brick, only: %i[ show edit update destroy ]

  # GET /bricks or /bricks.json
  def index
    @bricks = Brick.all
  end

  # GET /bricks/1 or /bricks/1.json
  def show
  end

  # GET /bricks/new
  def new
    @brick = Brick.new
  end

  # GET /bricks/1/edit
  def edit
  end

  # POST /bricks or /bricks.json
  def create
    @brick = Brick.new(brick_params)

    respond_to do |format|
      if @brick.save
        format.html { redirect_to brick_url(@brick), notice: "Brick was successfully created." }
        format.json { render :show, status: :created, location: @brick }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @brick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bricks/1 or /bricks/1.json
  def update
    respond_to do |format|
      if @brick.update(brick_params)
        format.html { redirect_to brick_url(@brick), notice: "Brick was successfully updated." }
        format.json { render :show, status: :ok, location: @brick }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @brick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bricks/1 or /bricks/1.json
  def destroy
    @brick.destroy

    respond_to do |format|
      format.html { redirect_to bricks_url, notice: "Brick was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brick
      @brick = Brick.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def brick_params
      params.require(:brick).permit(:title, :content)
    end
end
