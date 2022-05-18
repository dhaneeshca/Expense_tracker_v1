module EmployeesHelper
    def send_api_request(invoice_num)
        url = "https://my.api.mockaroo.com/invoices.json"
        payload = {:invoice_id => invoice_num}
        response = HTTParty.post(
            url,
            {
            body: payload.to_json,
            headers: {
                "Content-Type" => "application/json",
                "X-API-Key" => "b490bb80"
            }
            }
        )
        return response
    end

    def check_report_status(item_id, report_id)
        pending_state = Status.find_by status_state: "pending"
        status_state = Status.find_by status_state: "rejected"

        exp = Expense.find(item_id)
        exp.update(status: status_state)

        report_id = report_id
        status_id =pending_state.id

        @query = "select count(*) from expenses where report_id = %d and  status_id = %d;" % [report_id, status_id]
        records_array = ActiveRecord::Base.connection.execute(@query)
        if records_array.present?
            if records_array[0]["count"]==0
                fill_report(report_id)
            end
        end
    end

    def fill_report(report_id)
        expenses = Expense.where(report_id: report_id)
        req_amt = 0
        reimb_amt = 0
        status_state = Status.find_by status_state: "rejected"
        expenses.each do |item|
            req_amt += item.amount
            unless item.status_id == status_state.id
                reimb_amt += item.amount
            end
        end
        report = Report.find(report_id)
        report.update(applied_amt: req_amt,reimb_amt: reimb_amt)
    end
end
