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
    it 'dfghdfgh' do
      expect(file.identation).to eql([])
    end
  end

  describe '#line_length' do
    it 'dfghdfgh' do
      expect(file.identation).to eql([])
    end
  end
end
