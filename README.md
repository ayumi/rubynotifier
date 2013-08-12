## hello

it's [RubyNotifier.org](http://www.rubynotifier.org/)!

This awesome web sight notifies people of new Ruby releases. It's designed to run on Heroku!


## dev environment

* clone the repo

* replace config/database.yml settings with something appropriate for your local environment

* create an .env file with your RACK_ENV and PORT preferences. (see: .env.default)

* ```rake db:create```, ```bundle```, make sure you have [foreman](https://github.com/ddollar/foreman) installed and ```foreman start```

* ```mailcatcher``` is used for sending mail in dev


## deploying

Addons:

1. Heroku Scheduler:

* ```rake fetch_latest_ruby```, Hourly

* ```rake notify_emails```, Hourly

* ```rake dyno_keep_alive```, Every 10 minutes

2. Mandrill

3. Redis (currently using Redis Cloud)

Heroku config:

* ```h labs:enable user-env-compile```

* ```
heroku config:set SECRET_TOKEN=`openssl rand -base64 32`
```

* ```heroku config:set HEROKU_API_KEY=your_api_key HEROKU_APP=your_app_name``` (for dyno autoscaler gem for sidekiq for async email)

* google analytics: ```heroku config:set GA_TRACKING_ID=your_ga_id GA_DOMAIN=your_domain.org```


## credits

* the ruby gem logo was taken from Zohar Arad's 2012 presentation [Falling in love with Ruby](http://zohararad.github.io/presentations/falling-in-love-with-ruby/presentation)