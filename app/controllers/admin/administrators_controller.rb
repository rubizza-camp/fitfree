module Admin
  class AdministratorsController < Admin::ApplicationController
    before_action :set_admin, only: [:block, :unblock]

    def reset_password
      requested_resource.send_reset_password_instructions
      flash[:notice] = 'password was successfully reset!'
    end

    def block
      requested_resource.block!
    end

    def unblock
      requested_resource.unblock!
    end

    private

    def set_admin
      @admin = requested_resource
    end
  end
end
