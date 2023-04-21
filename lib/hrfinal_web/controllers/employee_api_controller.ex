defmodule HrfinalWeb.EmployeeApiController do
  alias Hrfinal.HumanResources
  use HrfinalWeb, :controller

  def index(conn, _params) do
    employees = HumanResources.list_employees()
    render(conn,:index,employees: employees)
  end
end
