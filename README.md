# RESTFUL-JSON-API

This API is built using Rails-API. For more information on Rails-API visit <https://github.com/rails-api/rails-api>.

# Getting Started

This app was built and tested using Ruby 2.0.0 and Rails 4.1.1 within a OSX 10 environment I recommend you use RVM <https://rvm.io/> to manage your gemsets.

In terminal run:

```bash
git clone https://github.com/damienh/restful-json-api.git
```

once you have moved into the restful-json-api directory run:

```bash
bundle install
```

you will then want to create the database and then seed for some sample data

```ruby
rake db:migrate
```

```ruby
rake db:seed
```

You are now good to go. You can start making requests. Here are some examples via the terminal with curl.

In order to do this you will need run:

```ruby
rails server
```

## Example Requests

## GET

```curl
curl -i -H "Accept: application/json" "localhost:3000/api/v1/users/{"1"}"
```

## POST

```curl
curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"user":{"username":"alan","email":"alan@me.com","password":"Xds6-x1c"}}'  http://localhost:3000/api/v1/users
```

## DELETE

```curl
curl -X DELETE -H "Accept: application/json"  -H "Content-Type: application/json" -H 'Authorization: Token token="foobar"' "localhost:3000/api/v1/users/{"1"}"
```


For more information on requests and their expected HTTP codes and responses visit <https://github.com/damienh/restful-json-api/wiki/HTTP-Status-and-Responses>
