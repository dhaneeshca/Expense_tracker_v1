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
    @employee = Employee.find(params[:emp_id])
    @expenses = Expense.where(employee: @employee)
  end

  def add_comment

    params[:comment][:user] = "admin"
    params[:comment][:user_id] = params[:id]
    begin
      @comments = Comment.where(expense_id: params[:comment][:expense_id])
      @count = @comments.count + 1
    rescue Exception => e
      @count = 1
    end
    params[:comment][:order] = @count

    begin
      @comment = Comment.create(params.require(:comment).permit(:message, :user, :user_id, :order, :expense_id))
    rescue Exception => e
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end

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
