# frozen_string_literal: true

class RemoveExternalCustomerIdFromEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :external_customer_id, :string
  end
end
