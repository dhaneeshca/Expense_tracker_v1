require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "should create employee" do
    visit employees_url
    click_on "New employee"

    fill_in "Address", with: @employee.address
    fill_in "Department", with: @employee.department
    fill_in "Dob", with: @employee.dob
    fill_in "Email", with: @employee.email
    fill_in "Firstname", with: @employee.firstname
    fill_in "Joining date", with: @employee.joining_date
    fill_in "Lastname", with: @employee.lastname
    fill_in "Phoneno", with: @employee.phoneno
    fill_in "Salary", with: @employee.salary
    fill_in "Sex", with: @employee.sex
    fill_in "Status", with: @employee.status_id
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "should update Employee" do
    visit employee_url(@employee)
    click_on "Edit this employee", match: :first

    fill_in "Address", with: @employee.address
    fill_in "Department", with: @employee.department
    fill_in "Dob", with: @employee.dob
    fill_in "Email", with: @employee.email
    fill_in "Firstname", with: @employee.firstname
    fill_in "Joining date", with: @employee.joining_date
    fill_in "Lastname", with: @employee.lastname
    fill_in "Phoneno", with: @employee.phoneno
    fill_in "Salary", with: @employee.salary
    fill_in "Sex", with: @employee.sex
    fill_in "Status", with: @employee.status_id
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee" do
    visit employee_url(@employee)
    click_on "Destroy this employee", match: :first

    assert_text "Employee was successfully destroyed"
  end
end
