# spec../lib/error_search.rb

require_relative '../lib/error_search'
require_relative '../lib/file'
#require_relative '../error_file'

describe File do
  let(:file) { File.new('error_file.rb') }

  describe '#trailing' do
    it 'Checks if the line has trailing space at the end' do
      expect(file.trailing).to eql([])
    end
  end

  describe '#identation' do
    it 'checks for the correct identation' do
      expect(file.identation).to eql([])
    end
  end

  describe '#line_length' do
    it 'checks if there are more than 120 characters line' do
      expect(file.identation).to eql([])
    end
  end

  describe '#blank_line' do
    it 'checks if there is a blank line' do
      expect(file.identation).to eql([])
    end
  end

  describe '#last_line' do
    it 'checks if there is a missing last line' do
      expect(file.identation).to eql([])
    end
  end
end
