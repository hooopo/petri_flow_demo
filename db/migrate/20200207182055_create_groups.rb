# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.timestamps
    end
    10.times { |_i| Group.create(name: 'Group#{i}') }
  end
end
