# frozen_string_literal: true

module LogoutHelper
  def logout_url
    domain = 'dev-osqz35jn.auth0.com'
    client_id = 'OzTbdwACQhyLgxM75k4npxh0g3Cyw7eT'
    request_params = {
      returnTo: 'http://localhost:3000/login',
      client_id: client_id
    }

    URI::HTTPS.build(host: domain, path: '/v2/logout', query: to_query(request_params))
  end

    private

  def to_query(hash)
    hash.map do |k, v|
      "#{k}=#{CGI.escape(v)}" unless v.nil?
    end .reject(&:nil?).join('&')
  end
  end
