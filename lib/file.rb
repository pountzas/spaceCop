require_relative './error_search'

class File
  include ErrorSearch
  attr_reader :path, :lines, :total_lines, :error_list

  def initialize(path)
    @path = path
    @lines = File.readlines(@path)
    @total_lines = lines.length
    @error_list = []
  end
end
