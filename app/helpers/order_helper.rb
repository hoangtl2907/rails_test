# frozen_string_literal: true

module OrderHelper
  def order_params(order, direction)
    params.merge(o: order, d: direction).permit(:q, :o, :d, :page)
  end
end
