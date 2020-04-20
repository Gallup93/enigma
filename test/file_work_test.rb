require './test/test_helper'

class FileWorkTest < Minitest::Test
  def setup
    @file_work = FileWork.new
  end

  def test_get_text
    expected = "this is only a test remain calm if you panic you will die this is for your own safety this is a test"
    assert_equal expected, @file_work.get_text('./files/read_from_test.txt')
  end

  def test_write_text
    text = "pbaewckmkhdkwvsfamlmnzenehspxfeme skkosbxhapwsggwqayhuwvauluemsvouyanuqaqlsashsex xfuuluemsvoutmpzkf"
    @file_work.write_text('./files/write_to_test.txt', text)
    assert_equal text, @file_work.get_text('./files/write_to_test.txt')
  end

  def test_create_file_path
    big_boom = "nuclear_launch_codes"
    assert_equal "./files/nuclear_launch_codes", @file_work.create_file_path(big_boom)
  end
end
