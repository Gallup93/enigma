require './test/test_helper'

class FileWorkTest < Minitest::Test
  def setup
    @file_work = FileWork.new
  end

  def test_get_text
    expected = "i need a beer"
    assert_equal expected, @file_work.get_text('./files/message_test.txt')
  end

  def test_write_text
    text = "qddtmhqphfvtz"
    @file_work.write_text('./files/encrypted_test.txt', text)
    assert_equal text, @file_work.get_text('./files/encrypted_test.txt')
  end

  def test_create_file_path
    big_boom = "nuclear_launch_codes"
    assert_equal "./files/nuclear_launch_codes", @file_work.create_file_path(big_boom)
  end
end
