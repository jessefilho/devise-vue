class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  
  private
  def responde_with(resource, _opt={})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: {
      message: 'Signed up sucessfully.',
      user: current_user
    }, status: :ok

  end

  def register_failed
    render json: {
      message: 'Something is worng.'
    }, status: :unprocessable_entity
  end
end
