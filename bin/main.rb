require 'colorize'
require_relative '../lib/file'

file = File.new(ARGV.first)
puts "File #{file.path.colorize(:blue)}.." + ' is been searched for errors.'.colorize(:yellow)
no_file = 'No file detected to search for errors.'
return no_file if file.path.nil?

file.file_info
file.last_line
file.blank_line
file.line_length
file.trailing
#p file.lines

if file.error_list.length.zero?
  puts 'No spece errors have been found, seems you got away from space cop this time'.colorize(:green)
else
  puts file.error_list
end
