# frozen_string_literal: true

require 'test_helper'

class TimeFramesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get time_frames_new_url
    assert_response :success
  end
end
