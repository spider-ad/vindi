# Vindi Ruby

Ruby gem to interace with [VINDI](https://www.vindi.com.br/) payment system.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vindi'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vindi

## Documentation

Make suke you have an account on [Vindi](vindi.com.br) and your API KEY.

Having an account on Vindi you cant get your API KEY from:

`Configuration > Company Data > API & Webhooks`


## Documentation

You can check the Vindi API Docs [here](http://vindi.github.io/api-docs/dist/).

## Usage

Given you have the API KEY and installed the Ruby gem you can start using:


```ruby
Vindi.configure { |c| c.api_key = "jivCMOdsf2edsdssfdgfsdr-FD324fDFFgf" }
```

or

```ruby
Vindi.api_key = "jivCMOdsf2edsdssfdgfsdr-FD324fDFFgf"
```

### Create Customer

Creating a customer

```ruby
client = {
  name: "Heisenberg",
  email: "hein@spire.ad",
  registration_code: 99,
  address: {
      city: "Sao Paulo",
      state: "SP",
      country: "BR"
  }
}

Vindi::Customer.create(client)

```

### List Customers

Listing all customers

```ruby
Vindi::Customer.all
```

Querying a customer by name

```ruby
Vindi::Customer.all(query: "name:joana")

```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/vindi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
