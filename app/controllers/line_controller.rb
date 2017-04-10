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

    profile_request_headers = {
        'Authorization' => "#{token_type} #{access_token}"
    }
    logger.debug("profile_request_headers #{profile_request_headers.to_s}")
    profile_response = RestClient.get 'https://api.line.me/v2/profile', profile_request_headers}

    @profile_response_json = profile_response.body
    @userId = @profile_response_json['userId']
    @display_name = @profile_response_json['displayName']
    @picture_url = @profile_response_json['pictureUrl']
    logger.debug("@userId = #{@userId}")
    logger.debug("@display_name = #{@display_name}")
    logger.debug("@picture_url = #{@picture_url}")
  end

end
