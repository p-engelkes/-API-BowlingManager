class ClubSerializer < ActiveModel::Serializer
  attributes :id, :name

  embed :ids
  has_many :users
end