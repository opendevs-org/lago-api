# frozen_string_literal: true

class ChangeCachedAggregationEventIdType < ActiveRecord::Migration[7.0]
  def up
    change_column :cached_aggregations, :event_id, :string
  end

  def down
    change_column :cached_aggregations, :event_id, :uuid
  end
end
