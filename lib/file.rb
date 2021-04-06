require_relative './error_search'

class File
  include ErrorSearch
  attr_reader :path, :lines, :total_lines, :error_list

  def initialize(path)
    @path = path
    @lines = []
    @total_lines = 0
    @error_list = []
  end

  def file_info
    @lines = File.readlines(@path)
    @total_lines = lines.length
  end
end
