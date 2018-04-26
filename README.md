# StellarFederation
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'stellar_federation'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install stellar_federation
```

## Usage

### Configure


A [federation server](https://www.stellar.org/developers/guides/anchor/3-federation-server.html) will respond to the following request with a response:

```
curl "https://www.your_org.com:8002/federation?q=tunde_adebayo*your_org.com&type=name"

{
  "stellar_address": "tunde_adebayo*your_org.com",
  "account_id": "GAIGZHHWK3REZQPLQX5DNUN4A32CSEONTU6CMDBO7GDWLPSXZDSYA4BU",
  "memo_type": "text",
  "memo": "tunde_adebayo"
}
```

The engine helps produce that output by configuring the engine in an initializer:

```ruby
StellarFederation.configure do |c|
  c.on_query = "FindStellarFederatedAddress"
end
```

- `c.on_query` contains a class the you define
- The `on_query` class should also return a `StellarFederation::QueryResponse`.
- You can return nothing if you don't find a record
- If you return something and it's not a `StellarFederation::QueryResponse`, the Rails engine will throw an exception.
- The `on_query` class will be called with `.call`, that accepts a `StellarFederation::Query` object:
  - `address_name` - ex: `tunder_adebayo*your_org.com`
  - `address_id` - ex: `tunder_adebayo`
  - `address_domain` - ex: `your_org.com`

Add to your routes:

```ruby
mount StellarFederation::Engine => "/stellar_federation"
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
