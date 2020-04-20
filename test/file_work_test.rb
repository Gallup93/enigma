require './test/test_helper'

class FileWorkTest < Minitest::Test
  def setup
    @file_work = FileWork.new
  end

  def test_get_text
    text = "this is only a test. remain calm! If you panic, you will die. This is for your own safety! This is a test."
    expected = "this is only a test remain calm if you panic you will die this is for your own safety this is a test"
    assert_equal expected, @file_work.get_text('./files/read_from_test.txt')
  end

  def test_write_text
    text = "pbaewckmkhdkwvsfamlmnzenehspxfeme skkosbxhapwsggwqayhuwvauluemsvouyanuqaqlsashsex xfuuluemsvoutmpzkf"
    @file_work.write_text('./files/write_to_test.txt', text)
    assert_equal text, @file_work.get_text('./files/write_to_test.txt')
  end
end
