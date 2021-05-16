class GithubService
  def call(params)
    params = github_params(params)

    response = establish_conn.post('/login/oauth/access_token') do |req|
      req.params['code'] = params[:code]
      req.params['client_id'] = params[:client_id]
      req.params['client_secret'] = params[:client_secret]
    end

    access_token = access_token(response.body)

    response = user_conn(access_token).get('/user')
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def github_params(params)
    { code: params[:code],
      client_id: ENV["CLIENT_ID"],
      client_secret: ENV["GITHUB_SECRET"]}
  end

  def access_token(data)
    JSON.parse(data)["access_token"]
  end

  def establish_conn
    Faraday.new(url: 'https://github.com', headers: {'Accept': 'application/json'})
  end

  def user_conn(access_token)
    Faraday.new(
      url: 'https://api.github.com',
      headers: {
          'Authorization': "token #{access_token}"
      }
    )
  end
end
