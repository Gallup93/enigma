class FileWork
  def get_text(file_path)
    file = File.open(file_path, "r")
    text = file.read
    text.delete!("\n")
    text.downcase
  end
end
