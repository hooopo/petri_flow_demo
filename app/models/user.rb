# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :group, optional: true
  has_one :party, as: :partable, class_name: 'Wf::Party'

  # NOTICE: group or user or role all has_many users
  has_many :users, foreign_key: :id

  after_create do
    create_party(party_name: name)
  end
end
