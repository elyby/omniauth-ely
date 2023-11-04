# OmniAuth Ely.by

This is the official OmniAuth strategy for authenticating to Ely.by. To
use it, you'll need to sign up for an OAuth2 Application ID and Secret
on the [Ely.by Account Applications Page](https://account.ely.by/dev/applications).

## Usage

Add the strategy to your `Gemfile` alongside OmniAuth:

```ruby
gem 'omniauth'
gem 'omniauth-ely'
```

Integrate this strategy to your OmniAuth middleware.

```ruby
use OmniAuth::Builder do
  provider :ely, 'application_id', 'secret'
end
```

You need to add your key and secret.

For more information check the [OmniAuth wiki](https://github.com/intridea/omniauth/wiki).
