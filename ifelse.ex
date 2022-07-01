defmodule Ifelse do

  #payload = %{"orderItems" => [%{"parameters" => %{"CONTACT_PERSON_FULL_NAME" => "Krish", "CONTACT_PERSON_EMAIL" => "test@test.com"}}]}
  def sample(payload) do
    [order_item | _] = Map.get(payload, "orderItems")
    if Map.has_key?(order_item["parameters"], "CONTACT_PERSON_EMAIL") do
      history()

    else
      "Invalid Email Name"

    end
    #Map.has_key?(%{a: 1}, :a)
    #email = Map.get(payload, "a", history())
    #fail()
  end

  def history() do
    "Email must be mandatory"
  end

  def fail() do
    "Failed notification"
  end

end
