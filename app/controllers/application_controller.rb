class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #related with sessions_controller.rb
  include SessionsHelper

  def hello
    render html: "hello, world!"
  end
end
