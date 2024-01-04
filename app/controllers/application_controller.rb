class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :back_path

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def back_path
    case "#{controller_name}/#{action_name}"
    when 'categories/index' || 'transactions/index' || 'categories/new'
      categories_path
    when 'transactions/new'
      category_transactions_path
    else
      root_path
    end
  end
end
