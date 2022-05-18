# json.extract! expense, :id, :invoice_num, :category, :description, :amount, :vendor, :exp_date, :status_id, :created_at, :updated_at

json.id expense.id
json.invoice_num expense.invoice_num
json.category expense.category
json.description expense.description
json.amount expense.amount
json.vendor expense.vendor
json.expense_date expense.exp_date

json.employee do
    json.name expense.employee.firstname+" "+expense.employee.lastname
    @employee = expense.employee
    json.url employee_url(@employee,format: :json)
end

if expense.invoice_img.attached?
    json.invoice_image url_for(expense.invoice_img)
end

json.status do
    json.state expense.status.status_state
    @status = expense.status
    json.url status_url(@status,format: :json)
end
# json.admin expense.admin

json.admin do
    json.admin_assigned expense.admin.name
    # json.url admin_url(admin,format: :json)
end

json.report do
    json.id expense.report.id
    json.title expense.report.title
end

json.extras expense.extras
json.url expense_url(expense, format: :json)
