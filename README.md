# OpenAlias ruby

This ruby gem allows you to lookup and read [OpenAlias](https://openalias.org) data with ruby.

OpenAlias ([openalias.org](https://openalias.org)) is an open standard for simpler addresses for any crypto currencies. [Read more here](https://openalias.org)

    At its most basic, OpenAlias is a TXT DNS record on a FQDN (fully qualified domain name). 
    By combining this with DNS-related technologies [it has] created an aliasing standard that is extensible for developers, 
    intuitive and familiar for users, and can interoperate with both centralised and decentralised domain systems.

It is using the [OpenAlias rust implementation](https://github.com/nabijaczleweli/openalias.rs/) - and is simply a ruby wrapper with a native rust extension.

Maybe this is a bad idea, but I had a few minutes and wanted to try it. It works perfectly (but gem install takes a while to compile the extension)
At some point it would probably be awesome to rewrite the whole thing in pure ruby - which is likely very easy.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'openalias'
```

Or install it yourself as:

    $ gem install openalias

## Usage

```ruby
Openalias.addresses('btc@michaelbumann.com')
=> [#<Openalias::CryptoAddress cryptocurrency="btc", address="3MGfEx4iaVEAy8nD4rWdocgrPo8aCR4Zfa", recipient_name="bumi">]

Openalias.addresses('donate.getmonero.org')
=> [#<Openalias::CryptoAddress cryptocurrency="xmr", address="44AFFq5kSiGBoZ4NMDwYtN18obc8AemS33DBLWs3H7otXft3XjrpDtQGv7SqSsaBYBb98uNbr2VBBEt7f2wfn3RVGQBEP3A", recipient_name="Monero Development", tx_description="Donation to Monero Core Team">, #<Openalias::CryptoAddress cryptocurrency="btc", address="1KTexdemPdxSBcG55heUuTjDRYqbC5ZL8H", recipient_name="Monero Development", tx_description="Donation to Monero Core Team">]

Openalias.addresses('donate.getmonero.org')[0].recipient_name
=> "Monero Development"

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bumi/openalias-ruby.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
