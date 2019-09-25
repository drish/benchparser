require 'spec_helper.rb'

RSpec.describe Benchparser do

  it "has a version number" do
    expect(Bp::VERSION).not_to be nil
  end

  it "should raise UnsupportedLang when invalid lang is provided" do

    expect { Bp.parse(:nim, "") }.to raise_error do |e|
      expect(e.class).to be Bp::UnsupportedLang
    end
  end

  it "should raise UnsupportedLang when lang is nil" do

    expect { Bp.parse(nil, "") }.to raise_error do |e|
      expect(e.class).to be Bp::UnsupportedLang
    end
  end

  it "should return Benchparser::Parsers::Go" do
    expect(Bp.parse(:go, "").class).to be Benchparser::Parsers::Go
  end
end
