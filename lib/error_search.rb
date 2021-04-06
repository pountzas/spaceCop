module ErrorSearch
  def blank_line
    msg = 'empty line is missing'
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
    msg = 'Final empty line is missing'
    @lines[-1].match?(/\n/) ? false : @error_list << "line:#{@total_lines + 1}:0 #{msg}"
  end
end
