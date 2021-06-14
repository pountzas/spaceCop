require 'colorize'

module ErrorSearch
  def trailing
    msg = 'Last character in line has a space'.colorize(:red)
    @lines.each_with_index do |line, x|
      line[-2] == ' ' ? @error_list << "line:#{x + 1}:0 #{msg}" : false
    end
    @error_list
  end

  # rubocop: disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def identation
    msg = 'has wrong identation has'.colorize(:red)
    msg2 = 'spaces and sould have'.colorize(:yellow)
    a = %w[def class module for if while unless until case else elsif]
    c = %w[else elsif end]
    ident_must = 0
    ident_is = 0
    @lines.each_with_index do |line, x|
      next if line.include?('puts') || line.strip.empty?

      ident_must -= 1 if c.include?(line.split.first)
      ident_is = line.index(/\w/)
      ident_is == ident_must * 2 ? false : @error_list << "line:#{x + 1}:0 #{msg} #{ident_is} #{msg2} #{ident_must * 2}"
      ident_must += 1 if a.include?(line.split.first) || line.include?('do') || line[-2] == ('|')
    end
    @error_list
  end

  # rubocop: enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  def line_length
    msg = 'Line has more than 120 characters'.colorize(:red)
    @lines.each_with_index do |line, x|
      line.length > 120 ? @error_list << "line:#{x + 1}:0 #{msg}" : false
    end
    @error_list
  end

  def blank_line
    msg = 'empty line error'.colorize(:red)
    a = %w[def class module for if while unless until case]
    @lines.each_with_index do |line, x|
      if a.include?(line.strip.split.first)
        @error_list << "line:#{x + 2}:0 #{msg}" if @lines[x + 1].strip.empty?
      else
        false
      end
    end
    @error_list
  end

  def last_line
    msg = 'Final empty line is missing'.colorize(:red)
    @lines[-1].match?(/\n/) ? false : @error_list << "line:#{@total_lines + 1}:0 #{msg}"
  end
  @error_list
end
