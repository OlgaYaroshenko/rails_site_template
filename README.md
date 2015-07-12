# Rails website template

    $ cd /tmp
    $ git clone https://github.com/railstutorial/sample_app_rails_4.git
    $ cd rail_website_template
    $ cp config/database.yml.example config/database.yml
    $ bundle install
    $ bundle install --without production
    $ bundle exec rake db:migrate
    $ bundle exec rake db:test:prepare
    $ bundle exec rspec spec/

If the tests don't pass, it means there may be something wrong with your system. If they do pass, then you can debug your code by comparing it with the reference implementation.

GIT

	$ git remote add origin https://github.com/<username>/<app_name>.git
	$ git push -u origin master

	$ git add .
	$ git commit -m "Initialize repository"
	$ git push

	$ git pull - pull repository to server

Create a new repository on the command line

touch README.md

	$ git init
	$ git add README.md
	$ git commit -m "first commit"
	$ git remote add origin https://github.com/Proalab/rubyonrails.git
	$ git push -u origin master
	
Push an existing repository from the command line

	$ git remote add origin https://github.com/Proalab/rubyonrails.git
	$ git push -u origin master


Heroku

    $ rake assets:precompile
    $ RAILS_ENV=production bundle exec rake assets:precompile
    $ git push heroku master
    $ heroku rake db:migrate
    $ heroku restart
    $ heroku open

Heroku database
https://devcenter.heroku.com/articles/pgbackups
https://devcenter.heroku.com/articles/heroku-postgres-import-export
or use PGAdmin

    $ heroku pgbackups:capture
    $ heroku pgbackups:url - backup to url
    $ heroku pgbackups:restore DATABASE 'https://s3.amazonaws.com/me/items/3H0q/mydb.dump'
