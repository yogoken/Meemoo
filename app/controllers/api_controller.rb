# coding: utf-8
class ApiController < ApplicationController
  rescue_from Exception, with: :error500
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404

  def error401(messages)
    render json: {
        message: 'Unauthorized',
        errors: messages
    }, status: 401
  end

  def error422(messages)
    render json: {
        message: 'Unprocessable Entity',
        errors: messages
    }, status: 422
  end

  def error403
    render json: {
        message: 'Forbidden'
    }, status: 403
  end

  def error404
    render json: {
        status: 404,
        message: 'Not Found'
    }, status: 404
  end

  def error500(e)
    render json: {
        status: 500,
        message: 'Internal Server Error'
    }, status: 500
  end
end
