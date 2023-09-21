# frozen_string_literal: true

module Types
  module Subscriptions
    class ChargeOverridesInput < Types::BaseInputObject
      argument :group_properties, [Types::Charges::GroupPropertiesInput], required: false
      argument :min_amount_cents, GraphQL::Types::BigInt, required: false
      argument :properties, Types::Charges::PropertiesInput, required: false
      argument :tax_codes, [String], required: false
    end
  end
end
