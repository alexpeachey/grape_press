# GrapePress

Create an application starter for Grape API projects.

## Installation

Install the gem:

    $ gem install grape_press

## Usage

`press new SlickApp`

You will be asked a few configuration questions, just answer as it suites your application.

You will then have a new application in `slick_app`.

Type `rackup` inside the `slick_app` directory to fire up your server.

## Useful features

### Rake commands

`rake routes`
`rake spec`

If you include ActiveRecord
`rake db:create`
`rake db:drop`
`rake db:migrate`
`rake db:rollback`

### A console

`bin/console`

## Contributing

1. Fork it ( https://github.com/Originate/grape_press/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
