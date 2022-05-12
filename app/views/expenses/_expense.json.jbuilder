# json.extract! expense, :id, :invoice_num, :category, :description, :amount, :vendor, :exp_date, :status_id, :created_at, :updated_at

json.id expense.id
json.invoice_num expense.invoice_num
json.category expense.category
json.description expense.description
json.amount expense.amount
json.vendor expense.vendor
json.expense_date expense.exp_date

json.status do
    json.state expense.status.status_state
    status = expense.status
    json.url status_url(status,format: :json)
end

json.url expense_url(expense, format: :json)
