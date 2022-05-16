class StatusesController < ApplicationController
  before_action :set_status, only: %i[ show edit update destroy ]

  # GET /statuses.json
  def index
    @statuses = Status.all
  end

  # GET /statuses/1.json
  def show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses.json
  def create
    @status = Status.new(status_params)

    respond_to do |format|
      if @status.save
        format.json { render :show, status: :created, location: @status }
      else
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statuses/1.json
  def update
    respond_to do |format|
      if @status.update(status_params)
        format.json { render :show, status: :ok, location: @status }
      else
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1.json
  def destroy
    @status.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def status_params
      params.require(:status).permit(:status_state)
    end
end
