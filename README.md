# Maxim Larionov FS PDP Blog

[![Build Status](https://semaphoreci.com/api/v1/projects/c5900883-0d22-4651-8b5a-bdb314cb7441/375408/shields_badge.svg)](https://semaphoreci.com/maximlarionov/pdp-blog)
[![Code Climate](https://codeclimate.com/repos/552cdca469568014df00046e/badges/9586f71fd9683419f5d7/gpa.svg)](https://codeclimate.com/repos/552cdca469568014df00046e/feed)
[![Test Coverage](https://codeclimate.com/repos/552cdca469568014df00046e/badges/9586f71fd9683419f5d7/coverage.svg)](https://codeclimate.com/repos/552cdca469568014df00046e/feed)


PDP Blog is created on Rails Base, the base Rails application template used at Flatstack.
It's based on Rails 4 and Ruby 2.1.5.


## Application Gems

* [Sass](https://github.com/rails/sass-rails) for Sass/Scss stylesheets
* [Zurb Foundation](https://github.com/zurb/foundation-rails) as CSS framework.
  For more information see [documentation on using Foundation in Rails apps](http://foundation.zurb.com/docs/applications.html)
* [Foundation Icon Font](https://github.com/zaiste/foundation-icons-sass-rails) for icons. Browse [icon set](http://zurb.com/playground/foundation-icon-fonts-3) examples
* [Autoprefixer](https://github.com/ai/autoprefixer-rails) for writing CSS without vendor prefixes
* [Slim](https://github.com/slim-template/slim) for views
* [Simple Form](https://github.com/plataformatec/simple_form) for forms
* [Decent Exposure](https://github.com/voxdolo/decent_exposure) to DRY controllers
* [Kaminari](https://github.com/amatsuda/kaminari) for pagination
* [Devise](http://github.com/plataformatec/devise) for basic auth
* [Rollbar](https://github.com/rollbar/rollbar-gem) for exception notification
* [Paperclip](https://github.com/thoughtbot/paperclip) for uploading and showing images
* [Paperclip-Dropbox](https://github.com/janko-m/paperclip-dropbox) for storing images on dropbox storage

## Development Gems

* [Thin](https://github.com/macournoyer/thin) as Rails web server
* [Foreman](https://github.com/ddollar/foreman) for managing development stack with Procfile
* [Letter Opener](https://github.com/ryanb/letter_opener) for opening mail in the browser instead of sending it
* [Bullet](https://github.com/flyerhzm/bullet) for detecting N+1 queries and unused eager loading
* [Rubocop](https://github.com/bbatsov/rubocop) for reporting violations of the Ruby style guide
* [Rails Best Practices](https://github.com/railsbp/rails_best_practices) for checking the code quality
* [Brakeman](https://github.com/presidentbeef/brakeman) for checking application for common security vulnerabilities
* [Pry Rails](https://github.com/rweng/pry-rails) for interactively exploring objects
* [Bundler Audit](https://github.com/rubysec/bundler-audit) for scanning the Gemfile for
  insecure dependencies based on published CVEs

## Testing Gems

* [Capybara](https://github.com/jnicklas/capybara) and [Capybara Webkit](https://github.com/thoughtbot/capybara-webkit)
  for integration testing, including JavaScript behavior
* [Factory Girl](https://github.com/thoughtbot/factory_girl) for test data
* [RSpec](https://github.com/rspec/rspec) for unit testing
* [Shoulda Matchers](http://github.com/thoughtbot/shoulda-matchers) for common RSpec matchers
* [Email Spec](https://github.com/bmabey/email-spec) for common matchers for testing emails
* [Site Prism](https://github.com/natritmeyer/site_prism) for using Page Object in acceptance testing
* [Rspec-Its](https://github.com/rspec/rspec-its) for better testing with subjects

## Initializers

* `01_config.rb` - shortcut for getting application config with `app_config`
* `mailer.rb` - setup default hosts for mailer from configuration
* `requires.rb` - automatically requires everything in lib/ & lib/extensions
* `dropbox.yml` - dropbox settings

## Scripts

* `bin/bootstrap` - setup required gems and migrate db if needed
* `bin/quality` - runs rubocop, brakeman, rails_best_practices and bundle-audit for the app
* `bin/ci` - should be used in the CI or locally
* `bin/server` - to run server locally

## Overriding Foundation Settings

Do your overrides in the `app/assets/stylesheets/core/_foundation_and_overrides.scss`

## Credits

PDP Blog is written by [Maxim Larionov](http://github.com/timurvafin), based on [Rails Base Skeleton](http://github.com/fs/rails-base)
Rails Base is maintained by [Timur Vafin](http://github.com/timurvafin).
It was written by [Flatstack](http://www.flatstack.com) with the help of our
[contributors](http://github.com/fs/rails-base/contributors).


[![Flatstack](https://avatars0.githubusercontent.com/u/15136?v=2&s=200)](http://www.flatstack.com)
