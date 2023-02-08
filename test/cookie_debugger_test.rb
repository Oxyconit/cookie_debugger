# frozen_string_literal: true

require 'test_helper'

class CookieDebuggerTest < Minitest::Test
  def test_call_print_debug_msg
    msg = CookieDebugger::Debug.call(ActionDispatch::Request.new({ 'HTTP_COOKIE' => '__testcookie=p%3Dt%2Cdp%3Dt; aa=23',
                                                                   'REQUEST_PATH' => '/',
                                                                   'REQUEST_METHOD' => 'GET',
                                                                   'HTTP_HOST' => 'test:3123' }))
    assert_equal 'CookieDebugger (total size: 34 bytes) from url: http://test:3123 ' \
                 '| Cookie: [__testcookie=8] [aa=2] ' \
                 '| Session: ', msg
  end
end
