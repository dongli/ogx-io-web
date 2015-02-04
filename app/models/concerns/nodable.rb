module Nodable
  extend ActiveSupport::Concern

  included do
    field :o, as: :order, type: Integer, default: 0
    field :l, as: :layer, type: Integer, default: 0

    has_many :children, class_name: "Node", inverse_of: :parent
    belongs_to :parent, class_name: "Node", inverse_of: :children
  end

  def parents
    result = []
    p = self.parent
    while p
      result.push(p)
      p = p.parent
    end
    result
  end
end