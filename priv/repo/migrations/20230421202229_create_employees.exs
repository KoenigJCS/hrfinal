defmodule Hrfinal.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :employee_id, :integer
      add :last_name, :string
      add :first_name, :string
      add :date_hired, :naive_datetime
      add :department, :string

      timestamps()
    end
  end
end
