# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc 'Starting the parser'
task :parser => :environment do
  require 'open-uri'
  require 'nokogiri'

  uri = 'https://news.ycombinator.com/'
  html = open(uri)

  doc = Nokogiri::HTML(html)
  title = doc.css('.storylink')
  autor = doc.css('.hnuser')
  title.zip(autor).each do |link, user|
    page = Page.new(title: link.text, url: link['href'], autor: user&.text)
    page.save
  end

end
