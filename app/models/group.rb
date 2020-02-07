# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :users
  has_one :party, as: :partable, class_name: 'Wf::Party'
  after_create do
    create_party(party_name: name)
  end
end
