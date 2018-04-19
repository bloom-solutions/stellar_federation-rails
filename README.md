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
  c.account_class = "User"
  c.account_query_scope = "find_by_stellar_federated_address"
  c.account_address_method = "stellar_friendly_id"
  c.account_id_method = "stellar_address"
  c.account_memo_method = "id"
end
```

- `account_class` - is the model that the engine will use to query and respond for queries on federation addresses
- `account_query_scope` - You define this in your account class: this is the scope on the model that the engine will call to search for a federated address given a query.
- `account_address_method` - You define this in your account class: this is the attribute/method of the model that the engine will call to supply the `stellar_address` key in the response
- `account_id_method` - You define this in your account class: this is the attribute/method of the model that the engine will call to supply the `account_id` key in the response
- `account_memo_method` - You define this in your account class: this is the attribute/method of the model that the engine will call to supply the `memo` key in the response. Usually an ID or a name

Add to your routes:

```ruby
mount StellarFederation::Engine => "/stellar_federation"
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
