# frozen_string_literal: true

class IntegrationItem < ApplicationRecord
  include PaperTrailTraceable

  belongs_to :integration, class_name: 'Integrations::BaseIntegration'

  ITEM_TYPES = [
    :standard,
    :tax,
  ].freeze

  enum item_type: ITEM_TYPES

  validates :external_id, presence: true
  validates :external_id, uniqueness: {scope: :integration_id}

  def self.ransackable_attributes(_auth_object = nil)
    %w[external_account_code external_id external_name]
  end
end
