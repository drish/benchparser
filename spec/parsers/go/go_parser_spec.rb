require 'spec_helper.rb'
require 'pry'

RSpec.describe Benchparser::Parsers::Go do

  subject { described_class }

  before do
    @data = File.read(File.expand_path("../../../fixtures/go/bench.txt", __FILE__))
  end

  it 'should return parsed data' do
    parsed = subject.parse(@data)
    expect(parsed).to_not be_nil
  end
end
