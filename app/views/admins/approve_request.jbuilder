json.array! @approved_expenses, partial: "expenses/expense", as: :expense
json.array! @rejected_expenses, partial: "expenses/expense", as: :expense
