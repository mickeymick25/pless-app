source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'cancan'
gem 'compass-rails', '~> 2.0.alpha.0'
gem 'devise'
gem 'devise_invitable'
gem 'figaro'
gem 'rolify'
gem 'simple_form', '>= 3.0.0.rc'
gem 'gibbon'
gem 'thin'
gem 'zurb-foundation'
gem 'modernizr'
gem "font-awesome-rails"

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'hub', :require=>nil
  gem 'quiet_assets'
end

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end

group :production do
	gem 'pg'
	gem 'rails_12factor'

  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end