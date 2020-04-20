class FileWork
  def get_text(file_path)
    file = File.open(file_path)
    file.rewind
    text = file.read
    text = text.gsub(/[^0-9a-z ]/i, '')
    text = text.downcase
  end

  def write_text(file_path, text)
    new_file = File.open(file_path, "w")
    new_file.write(text)
    new_file.close
  end

  def create_file_path(file_name)
    './files/' + file_name
  end
end
