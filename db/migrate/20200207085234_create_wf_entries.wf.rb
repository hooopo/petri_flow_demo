# frozen_string_literal: true

# This migration comes from wf (originally 20200131200455)

class CreateWfEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :wf_entries, comment: 'user input data for workitem with form.' do |t|
      t.string :user_id, index: true
      t.bigint :workitem_id, index: true
      if /mysql/i.match?(ActiveRecord::Base.connection.adapter_name)
        t.json 'payload'
      elsif /postgre/i.match?(ActiveRecord::Base.connection.adapter_name)
        t.json 'payload', default: {}
      end
      t.timestamps
    end
    remove_column :wf_workitems, :payload
    add_column :wf_field_values, :entry_id, :bigint, index: true
    add_index :wf_entries, %i[workitem_id user_id], unique: true
  end
end
