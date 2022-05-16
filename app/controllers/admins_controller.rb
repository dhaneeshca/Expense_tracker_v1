class AdminsController < ApplicationController
  before_action :set_admin, only: %i[ show edit update destroy ]

  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.json { render :show, status: :created, location: @admin }
      else
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.json { render :show, status: :ok, location: @admin }
      else
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1.json
  def destroy
    @admin.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def search
    set_admin
    @employee = Employee.find(params[:emp_id])
    @expenses = Expense.where(employee: @employee)
    print @expenses
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(:name, :password, :token)
    end
end
