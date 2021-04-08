# spec../lib/error_search.rb

require_relative '../lib/error_search'
require_relative '../lib/file'

describe File do
  let(:file) { File.new('.\\error_file.rb') }

  describe '#trailing' do
    it 'Checks if the line has trailing space at the end' do
      expect(file.trailing).to eql(["line:10:0 \e[0;31;49mLast character in line has a space\e[0m"])
    end

    it 'Returns an error' do
      expect(file.trailing).to_not eql([])
    end
  end

  describe '#identation' do
    it 'Returns 3 errors' do
      expect(file.identation.length).to eql(3)
    end

    it 'Returns false if it finds other than 3 errors' do
      expect(file.identation.length).to_not eql(0)
    end
  end

  describe '#line_length' do
    it 'error if the line has more than 120 characters' do
      expect(file.line_length).to eql(["line:25:0 \e[0;31;49mLine has more than 120 characters\e[0m"])
    end
  end

  describe '#blank_line' do
    it 'returns an error when the line is not needed' do
      expect(file.blank_line).to eql(["line:11:0 \e[0;31;49mempty line error\e[0m"])
    end
  end

  describe '#last_line' do
    it 'returns an error when there is not a last empty line' do
      expect(file.last_line).to eql(["line:26:0 \e[0;31;49mFinal empty line is missing\e[0m"])
    end
  end
end
