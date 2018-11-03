require "spec_helper"

RSpec.describe Openalias do
  it "has a version number" do
    expect(Openalias::VERSION).not_to be nil
  end

  it "provides ? methods to check for the currency" do
    expect(Openalias.addresses('donate.getmonero.org').find { |c| c.cryptocurrency.downcase == 'xmr' }.xmr?).to eql(true)
    expect(Openalias.addresses('donate.getmonero.org').find { |c| c.cryptocurrency.downcase == 'xmr' }.btc?).to eql(false)
    expect(Openalias.addresses('donate.getmonero.org').find(&:xmr?).xmr?).to eql(true)
    expect(Openalias.addresses('donate.getmonero.org').find(&:xmr?).xmr).to eql(true)
  end

  it "provides accessors for the data" do
    expect(Openalias.addresses('donate.getmonero.org')[0].recipient_name).to eql('Monero Development')
    expect(Openalias.addresses('donate.getmonero.org').find { |c| c.cryptocurrency.downcase == 'xmr' }.address).to eql('44AFFq5kSiGBoZ4NMDwYtN18obc8AemS33DBLWs3H7otXft3XjrpDtQGv7SqSsaBYBb98uNbr2VBBEt7f2wfn3RVGQBEP3A')
  end

  it "returns and crypto addresses array" do
    expect(Openalias.addresses('donate.getmonero.org').class).to eql(Array)
    expect(Openalias.addresses('donate.getmonero.org').length).to eql(2)
  end

  it "returns an empty array if no openalias data is found" do
    expect(Openalias.addresses('wikipedia.org')).to eql([]) # I hope this one fails soon when wikipedia has some OpenAlias entries
  end

  it "returns an empty array for invalid domains" do
    expect(Openalias.addresses('ihopethisdomainneverexists123invalid.com')).to eql([])
  end

end
