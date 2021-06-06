module Dashboard
  class AdminUsersController < BaseController
    before_action :set_admin_user, only: %w[show edit update destroy]
    helper_method :order_params

    def index
      service = Search::AdminUsersService.new(query_params)
      @admin_users = service.execute
    end

    def show; end

    def new
      @admin_user = AdminUser.new
    end

    def create
      admin_user = AdminUser.create(admin_user_params)

      if admin_user.errors.present?
        flash[:errors] = admin_user.errors.full_messages
        redirect_to action: :new
      else
        redirect_to action: :index
      end
    end

    def edit; end

    def update
      @admin_user.update(admin_user_params)

      if @admin_user.errors.present?
        flash[:errors] = @admin_user.errors.full_messages
        redirect_to action: :edit
      else
        redirect_to action: :index
      end
    end

    def destroy
      @admin_user.destroy

      redirect_to action: :index
    end

    def order_params(order, direction)
      params.merge(o: order, d: direction, page: params[:page]).permit(:o, :d, :page)
    end

    private

    def set_admin_user
      @admin_user = AdminUser.find_by(id: params[:id])
    end

    def admin_user_params
      params.require(:admin_user).permit(
        :email, :name, :password, :age, :phone, :address
      )
    end

    def query_params
      params.permit(:q, :o, :d)
    end
  end
end
