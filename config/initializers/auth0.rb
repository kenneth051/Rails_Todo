Rails.application.config.middleware.use OmniAuth::Builder do
    provider(
      :auth0,
      'OzTbdwACQhyLgxM75k4npxh0g3Cyw7eT',
      'tHJvgu2Qcx15syEKE8w8pfmaSO-Iu2Wv9UstCUKa76G-RKDyLOtyNoLSnZUZ0ffY',
      'dev-osqz35jn.auth0.com',
      callback_path:'/auth/auth0/callback',
      authorize_params: {
        scope: 'openid email profile'
      }
    )
  end