module ControllerMacros
  def sign_in(user)
    if user.nil?
      request.env['warden'].stub(:authenticate!)
             .and_throw(:warden, { scope: :user })
      controller.stub current_user: nil
    else
      request.env['warden'].stub(authenticate!: user)
      controller.stub current_user: user
    end
  end
end
