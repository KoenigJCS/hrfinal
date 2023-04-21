defmodule HrfinalWeb.EmployeeControllerTest do
  use HrfinalWeb.ConnCase

  import Hrfinal.HumanResourcesFixtures

  @create_attrs %{date_hired: ~N[2023-04-20 20:22:00], department: "some department", employee_id: 42, first_name: "some first_name", last_name: "some last_name"}
  @update_attrs %{date_hired: ~N[2023-04-21 20:22:00], department: "some updated department", employee_id: 43, first_name: "some updated first_name", last_name: "some updated last_name"}
  @invalid_attrs %{date_hired: nil, department: nil, employee_id: nil, first_name: nil, last_name: nil}

  describe "index" do
    test "lists all employees", %{conn: conn} do
      conn = get(conn, ~p"/employees")
      assert html_response(conn, 200) =~ "Listing Employees"
    end
  end

  describe "new employee" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/employees/new")
      assert html_response(conn, 200) =~ "New Employee"
    end
  end

  describe "create employee" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/employees", employee: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/employees/#{id}"

      conn = get(conn, ~p"/employees/#{id}")
      assert html_response(conn, 200) =~ "Employee #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/employees", employee: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Employee"
    end
  end

  describe "edit employee" do
    setup [:create_employee]

    test "renders form for editing chosen employee", %{conn: conn, employee: employee} do
      conn = get(conn, ~p"/employees/#{employee}/edit")
      assert html_response(conn, 200) =~ "Edit Employee"
    end
  end

  describe "update employee" do
    setup [:create_employee]

    test "redirects when data is valid", %{conn: conn, employee: employee} do
      conn = put(conn, ~p"/employees/#{employee}", employee: @update_attrs)
      assert redirected_to(conn) == ~p"/employees/#{employee}"

      conn = get(conn, ~p"/employees/#{employee}")
      assert html_response(conn, 200) =~ "some updated department"
    end

    test "renders errors when data is invalid", %{conn: conn, employee: employee} do
      conn = put(conn, ~p"/employees/#{employee}", employee: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Employee"
    end
  end

  describe "delete employee" do
    setup [:create_employee]

    test "deletes chosen employee", %{conn: conn, employee: employee} do
      conn = delete(conn, ~p"/employees/#{employee}")
      assert redirected_to(conn) == ~p"/employees"

      assert_error_sent 404, fn ->
        get(conn, ~p"/employees/#{employee}")
      end
    end
  end

  defp create_employee(_) do
    employee = employee_fixture()
    %{employee: employee}
  end
end
