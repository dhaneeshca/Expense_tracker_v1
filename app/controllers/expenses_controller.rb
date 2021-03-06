class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[ show edit update destroy ]

  # GET /expenses.json
  def index
    @expenses = Expense.all
  end

  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)
    respond_to do |format|
      if @expense.save
        response =helpers.send_api_request(@expense.invoice_num)
        if response["status"].to_s == "false"
          status_state = Status.find_by status_state: "rejected"
          @expense.update(status: status_state)
          helpers.check_report_status_exp(@expense.report_id)
        end
        format.json { render :show, status: :created, location: @expense }
      else
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.json { render :show, status: :ok, location: @expense }
      else
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1.json
  def destroy
    @expense.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def upload_image

    set_expense
    @expense.invoice_img.attach(params["image_url"])
    unless @expense.invoice_img.attached?
      render json: "failed", status: :unprocessable_entity
    else
      render json: { success: true }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      unless params["expense"].key?(:status_id)
        status_state = Status.find_by status_state: "pending"
        params["expense"][:status_id] = status_state.id
      end
      unless params["expense"].key?(:admin_id)
        @admin = Admin.first
        params["expense"][:admin_id] = @admin.id
      end
      unless params["expense"].key?(:report_title)
        params["expense"][:title] = ""
      end
      params["expense"][:title] = params["expense"][:report_title]

      @report = Report.create(params.require(:expense).permit(:title))
      params["expense"][:report_id] = @report.id

      params.require(:expense).permit(:invoice_num, :category, :description, :amount, :vendor, :exp_date, :status_id, :extras, :comments, :admin_id, :employee_id, :invoice_img, :report_id)
    end
end
