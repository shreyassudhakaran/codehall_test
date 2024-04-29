class ApplicationController < ActionController::API
  around_action :handle_exceptions

  private

  # Catch exception and return JSON-formatted error
  def handle_exceptions
    begin
      yield
    rescue StandardError => exception
      track_error(exception)
      render_failure_response(exception.try(:message))
    end
  end

  def render_success_response(resources = {}, message = "")
    json_response({ success: true, message: message, data: resources}, 200)
  end

  def render_failure_response(message = '')
    json_response({ success: false, errors: message }, 400)
  end

  def json_response(options = {}, status)
    render json: JsonResponse.new(options), status: status
  end

  def track_error(exception)
    log_exception(exception, error_context)
  end

  def error_context
    {
    params: params.try(:to_json), request_body: request.try(:body).try(:to_json)
    }
  end

  def log_exception(exception, context_params = {})
    Rails.logger.error(exception.message)
    Rails.logger.error("context_params: #{context_params}")
  end
end
