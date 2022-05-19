module ExpensesHelper
    def check_report_status_exp(report_id)
        report_id = report_id
        pending_state = Status.find_by status_state: "pending"

        @report = Report.find(report_id)
        status_id =pending_state.id

        @query = "select count(*) from expenses where report_id = %d and  status_id = %d;" % [report_id, status_id]
        records_array = ActiveRecord::Base.connection.execute(@query)
        if records_array.present?
            if records_array[0]["count"] == 0 and @report.mail_flag == 0
                fill_report_exp(report_id)
                @report.update(mail_flag: 1)
            end
        end
    end

    def fill_report_exp(report_id)
        expenses = Expense.where(report_id: report_id)
        req_amt, reimb_amt, exp_id = 0, 0, 0
        @status_state = Status.find_by status_state: "rejected"

        expenses.each do |item|
            req_amt += item.amount
            unless item.status_id == @status_state.id
                reimb_amt += item.amount
            end
            exp_id = item.employee_id
        end

        employee = Employee.find(exp_id)
        report = Report.find(report_id)
        report.update(applied_amt: req_amt,reimb_amt: reimb_amt)
        message = {}
        message[:email] =  employee.email
        message[:subject] = "Report for your submitted expense for ",report.title
        message[:content] = "Hi ",employee.firstname," ",employee.lastname,"!!,\n     Total applied amount:",req_amt,"\n     Total approved amount:",reimb_amt,"\nFor futher details,\nPlease look into the portal."
        NotificationMailer.new_email(message).deliver_later
    end
end
