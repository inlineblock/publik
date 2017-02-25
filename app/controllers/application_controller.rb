class ApplicationController < ActionController::Base
  protect_from_forgery({ with: :exception })

  rescue_from(ActionController::ParameterMissing, { with: :rescue_from_parameter_missing })
  rescue_from(ActiveRecord::RecordNotSaved, { with: :rescue_from_record_not_saved })
  rescue_from(ActiveRecord::RecordInvalid, { with: :rescue_from_record_invalid })
  rescue_from(ActiveRecord::RecordNotDestroyed, { with: :rescue_from_record_not_destroyed })
  rescue_from(ActiveRecord::RecordNotFound, { with: :rescue_from_record_not_found })

  protected

  def rescue_from_parameter_missing(exception)
    rescue_from(:bad_request, exception)
  end

  def rescue_from_record_not_saved(exception)
    rescue_from(:unprocessable_entity, exception)
  end

  def rescue_from_record_not_found(exception)
    rescue_from(:not_found, exception)
  end

  def rescue_from_record_invalid(exception)
    rescue_from(:unprocessable_entity, exception)
  end

  def rescue_from_record_not_destroyed(exception)
    rescue_from(:unprocessable_entity, exception)
  end

  def rescue_from(status_code, exception)
    message = {
      message: exception.message,
    }
    render({ json: message.to_json, status: status_code })
  end
end
