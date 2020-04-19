require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_work'

class FileWorkTest < Minitest::Test
  def setup
    @file_work = FileWork.new
  end

  def test_get_text
    expected = "this is only a test. remain calm! if you panic, you will die. this is for your own safety! this is a test."
    assert_equal expected, @file_work.get_text('./files/uncrypted_test.txt')
  end
end
