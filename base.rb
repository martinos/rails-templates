if yes?("Do you want to use RSpec for testing?")
  plugin "rspec", :git => "git://github.com/dchelimsky/rspec.git"
  plugin "rspec-rails", :git => "git://github.com/dchelimsky/rspec-rails.git"
  generate :rspec
end
if yes?("Do you want to use Shoulda for testing?")
  gem "thoughtbot-shoulda", :lib => "shoulda", :source => "http://gems.github.com"
end

gem "thoughtbot-factory_girl", :lib => "factory_girl", :source => "http://gems.github.com"

rake "gems:install"

generate :nifty_layout

git :init

run "echo 'TODO add readme content' > README"
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

file ".gitignore", <<-END
# Tmp files
*.orig
*.swp

# Source control files
.hgignore
.hg*
**/*.svn
.svn

# Rails files
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

git :add => ".", :commit => "-m 'initial commit'"
