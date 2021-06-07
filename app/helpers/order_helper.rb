# frozen_string_literal: true

module OrderHelper
  def order_params(order, direction)
    params.merge(o: order, d: direction, page: params[:page]).permit(:o, :d, :page)
  end
end
