# json.extract! employee, :id, :firstname, :lastname, :dob, :phoneno, :sex, :joining_date, :department, :salary, :email

json.id employee.id
json.name employee.firstname+" "+employee.lastname
json.dob employee.dob
json.sex employee.sex
json.joining_date employee.joining_date
json.department employee.department
json.salary employee.salary

json.status do
    json.state employee.status.status_state
    status = employee.status
    json.url status_url(status,format: :json)
end

json.url employee_url(employee, format: :json)
