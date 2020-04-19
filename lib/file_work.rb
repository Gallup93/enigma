class FileWork
  def get_text(file_path)
    file = File.open(file_path)
    file.rewind
    text = file.read
    text = text.gsub(/[^0-9a-z ]/i, '')
    text = text.downcase
  end
end
