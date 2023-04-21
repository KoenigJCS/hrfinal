defmodule HrfinalWeb.EmployeeApiJSON do
  def index(%{employees: employees}) do
  %{data:
      for(employee <- employees) do
        %{employee_id: employee.employee_id, last_name: employee.last_name,first_name: employee.first_name,date_hired: employee.date_hired,department: employee.department}
      end
    }
  end
end
