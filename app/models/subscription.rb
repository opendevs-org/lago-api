# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :plan
  belongs_to :previous_subscription, class_name: 'Subscription', optional: true

  has_one :organization, through: :customer
  has_one :next_subscription, class_name: 'Subscription', foreign_key: :previous_subscription_id

  has_many :invoices
  has_many :fees

  STATUSES = [
    :pending,
    :active,
    :terminated,
    :canceled,
  ].freeze

  enum status: STATUSES

  def mark_as_active!
    self.started_at ||= Time.zone.now
    active!
  end

  def mark_as_terminated!
    self.terminated_at ||= Time.zone.now
    terminated!
  end

  def mark_as_canceled!
    self.canceled_at ||= Time.zone.now
    canceled!
  end
end
