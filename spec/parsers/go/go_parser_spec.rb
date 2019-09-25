require 'spec_helper.rb'

RSpec.describe Benchparser::Parsers::Go do

  subject { described_class }

  describe 'bench1 file' do

    before do
      @data = File.read(File.expand_path("../../../fixtures/go/bench1.txt", __FILE__))
    end

    it 'should return parsed data' do
      parsed = subject.parse(@data)
      expect(parsed.configs[:goos]).to eql('darwin')
      expect(parsed.configs[:goarch]).to eql('amd64')
      expect(parsed.configs[:pkg]).to eql('github.com/drish/parser')

      expect(parsed.functions.count).to eql(5)

      expect(parsed.functions.first[:name]).to eql('BenchmarkFib1-8')
      expect(parsed.functions.first[:iterations]).to eql("1000000000")
      expect(parsed.functions.first[:ns_op]).to eql("2.48")
      expect(parsed.functions.first[:bytes_op]).to eql("0")
      expect(parsed.functions.first[:allocs_op]).to eql("0")
    end
  end

  describe 'bench2 file' do

    before do
      @data = File.read(File.expand_path("../../../fixtures/go/bench2.txt", __FILE__))
    end

    it 'should return parsed data' do
      parsed = subject.parse(@data)

      # configs
      expect(parsed.configs[:goos]).to eql('darwin')
      expect(parsed.configs[:os]).to eql('Mac OS X 10.11.3')
      expect(parsed.configs[:goarch]).to eql('amd64')
      expect(parsed.configs[:cpu]).to eql('Intel(R) Core(TM) i7-4980HQ CPU @ 2.80GHz')
      expect(parsed.configs[:mem]).to eql('16 GB')
      expect(parsed.configs[:"cpu-count"]).to eql('8')

      # benchmarks
      expect(parsed.functions.first[:name]).to eql('BenchmarkDecode/text=digits/level=speed/size=1e4-8')
      expect(parsed.functions.first[:iterations]).to eql("100")
      expect(parsed.functions.first[:ns_op]).to eql("154125")
      expect(parsed.functions.first[:bytes_op]).to eql("40418")
      expect(parsed.functions.first[:allocs_op]).to eql("7")
    end
  end
end
