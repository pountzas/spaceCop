require 'colorize'
require_relative '../lib/file'

file = File.new(ARGV.first)
puts "File #{file.path}.. is been searched for errors."
return 'No file detected to search for errors.' if file.path.nil?

file.file_info
file.last_line
file.blank_line
file.line_length
#p file.lines

if file.error_list.length.zero?
  puts 'No spece errors have been found, seems you got away from space cop this time'.colorize(:green)
else
  puts file.error_list
end
