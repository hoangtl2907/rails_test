module Search
  class AdminUsersService
    attr_reader :errors

    def initialize(params)
      @search_query = params[:q]
      @order_query = params[:o]
      @direction_query = params[:d]
      @params = params
      @records = AdminUser.all
    end

    def execute
      search
      paginate
      order

      @records
    end

    private

    def search
      return if @search_query.blank?

      search_cond = [
        'MATCH(name) AGAINST(:search_query) || name like :like_query',
        {
          search_query: @search_query,
          like_query: "%#{@search_query}%"
        }
      ]
      @records = @records.where(search_cond)
    end

    def paginate
      @records = @records.page(@params[:page])
                         .extending(JsonPaginatable)
    end

    def order
      if @order_query.present? && @direction_query.present?
        @records = @records.order(@order_query => @direction_query)

        return
      end

      @records = @records.order(created_at: :desc)
    end
  end
end
