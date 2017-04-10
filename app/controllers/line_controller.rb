class LineController < ApplicationController

  def index
  end

  def loggedin
    code = params[:code]
    state = params[:test]
    logger.debug("code = #{code}")
    logger.debug("state = #{state}")
    request_body = "grant_type=authorization_code&code=#{code}&client_id=#{ENV['client_id']}&client_secret=#{ENV['client_secret']}&redirect_uri=#{ENV['redirect_uri']}"
    response = RestClient.post 'https://api.line.me/v2/oauth/accessToken', request_body, {content_type: 'application/x-www-form-urlencoded'}

    @response_json = response.body
    access_token = @response_json['access_token']
    token_type = @response_json['token_type']
    refresh_token = @response_json['refresh_token']
    logger.debug("access_token = #{access_token}")
    logger.debug("token_type = #{token_type}")
    logger.debug("refresh_token = #{refresh_token}")


  end

end
