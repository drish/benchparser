require 'spec_helper.rb'

RSpec.describe Benchparser::Parsers::Go do

  subject { described_class }

  before do
    @data = File.read(File.expand_path("../../../fixtures/go/bench.txt", __FILE__))
  end

  it 'should return parsed data' do
    parsed = subject.parse(@data)
    expect(parsed.goos).to eql('darwin')
    expect(parsed.goarch).to eql('amd64')
    expect(parsed.pkg).to eql('github.com/drish/parser')
    expect(parsed.functions.count).to eql(5)

    expect(parsed.functions.first[:name]).to eql('BenchmarkFib1-8')
    expect(parsed.functions.first[:iterations]).to eql("1000000000")
  end
end
