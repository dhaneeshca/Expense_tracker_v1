class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.json { render :show, status: :created, location: @employee }
      else
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.json { render :show, status: :ok, location: @employee }
      else
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1.json
  def destroy
    @employee.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  # Post all th expenses
  def post_expenses
    @admin = Admin.first
    @status_state = Status.find_by status_state: "pending"

    params[:expenses].each do |item|
      unless item.key?(:status_id)
        item[:status_id] = @status_state.id
      end
      unless item.key?(:admin_id)
        item[:admin_id] = @admin.id
      end
    end
    @expenses = Expense.create(params.permit(expenses: [:invoice_num, :category, :description, :amount, :vendor, :exp_date, :status_id, :extras, :comments, :admin_id]).require(:expenses))

    # Raise error if any failed
    unless @expenses.all?(&:persisted?)
      format.json { render json: @expenses.errors, status: :unprocessable_entity }
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:firstname, :lastname, :dob, :phoneno, :sex, :joining_date, :department, :salary, :email, :address, :status_id)
    end
end
