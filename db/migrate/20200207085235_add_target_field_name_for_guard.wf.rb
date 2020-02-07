# frozen_string_literal: true

# This migration comes from wf (originally 20200201001543)

class AddTargetFieldNameForGuard < ActiveRecord::Migration[6.0]
  def change
    add_column :wf_guards, :target_attr_name, :string, comment: "point to workflow targetable's attribute"
  end
end
