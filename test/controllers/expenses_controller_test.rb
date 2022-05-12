require "test_helper"

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @expense = expenses(:one)
  end

  test "should get index" do
    get expenses_url, as: :json
    assert_response :success
  end

  test "should create expense" do
    assert_difference("Expense.count") do
      post expenses_url, params: { expense: { amount: @expense.amount, category: @expense.category, description: @expense.description, exp_date: @expense.exp_date, invoice_num: @expense.invoice_num, status_id: @expense.status_id, vendor: @expense.vendor } }, as: :json
    end

    assert_response :created
  end

  test "should show expense" do
    get expense_url(@expense), as: :json
    assert_response :success
  end

  test "should update expense" do
    patch expense_url(@expense), params: { expense: { amount: @expense.amount, category: @expense.category, description: @expense.description, exp_date: @expense.exp_date, invoice_num: @expense.invoice_num, status_id: @expense.status_id, vendor: @expense.vendor } }, as: :json
    assert_response :success
  end

  test "should destroy expense" do
    assert_difference("Expense.count", -1) do
      delete expense_url(@expense), as: :json
    end

    assert_response :no_content
  end
end
