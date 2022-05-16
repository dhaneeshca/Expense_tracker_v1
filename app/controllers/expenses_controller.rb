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

  def arrive
    @expense = Expense.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expense_params
      params.require(:expense).permit(:invoice_num, :category, :description, :amount, :vendor, :exp_date, :status_id, :extras, :comments, :admin_id)
    end
end
