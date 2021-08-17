class CatSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url, :breed

  def breed
      object.breed.name
  end
end