# frozen_string_literal: true

class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    user_info = User.find_or_create(request.env['omniauth.auth'])

    session[:userinfo] = user_info

    # Redirect to the URL you want after successful auth
    redirect_to '/'
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end
  end
