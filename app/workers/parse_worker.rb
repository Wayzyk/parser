class ParseWorker
  include Sidekiq::Worker

  def perform

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
end
