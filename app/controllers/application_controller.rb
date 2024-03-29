class ApplicationController < ActionController::Base
    include DeviseTokenAuth::Concerns::SetUserByToken
    protect_from_forgery unless: -> { request.format.json? }
    serialization_scope :view_context
end
