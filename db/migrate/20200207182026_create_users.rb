# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.bigint :group_id
      t.timestamps
    end
    10.times { |i| User.create(name: "User#{i}", password: '111111') }
  end
end
