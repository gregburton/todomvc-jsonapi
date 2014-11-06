class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :order, :completed, :created_at, :updated_at

  # def title
  #   "#{object.title}"
  # end
  #
  # def order
  #   "#{object.order}"
  # end
  #
  # def completed
  #   "#{object.completed}"
  # end
  #
  # def created_at
  #   object.created_at.to_i
  # end
  #
  # def updated_at
  #   object.updated_at.to_i
  # end
end
