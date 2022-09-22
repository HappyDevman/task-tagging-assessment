# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    Rails.logger << '========== Not authorized! ==========='
  end

  def pundit_user; end
end
