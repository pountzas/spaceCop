module ErrorSearch
  def trailing
    msg = 'Last character in line has a space'.colorize(:red)
    @lines.each_with_index do |line, x|
      line[-2] == ' ' ? @error_list << "line:#{x + 1}:0 #{msg}" : false
    end
  end

  def line_length
    msg = 'Line has to many characters'.colorize(:red)
    @lines.each_with_index do |line, x|
      line.length > 120 ? @error_list << "line:#{x + 1}:0 #{msg}" : false
    end
  end

  def blank_line
    msg = 'empty line found error'.colorize(:red)
    a = %w[def class module for if while unless until]
    @lines.each_with_index do |line, x|
      if a.include?(line.strip.split.first)
        @error_list << "line:#{x + 2}:0 #{msg}" if @lines[x + 1].strip.empty?
      else
        false
      end
    end
  end

  def last_line
    msg = 'Final empty line is missing'.colorize(:red)
    @lines[-1].match?(/\n/) ? false : @error_list << "line:#{@total_lines + 1}:0 #{msg}"
  end
end
