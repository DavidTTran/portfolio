Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :github,
    ENV["github_client_id"],
    ENV["github_client_secret"],
    scope: "user:email"
  )
end

OmniAuth.config do |config|
  config.failure_raise_out_environments = ['test', 'development', 'staging', 'production']
end
