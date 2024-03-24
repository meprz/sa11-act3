

# https://rubular.com/r/H4O0JukTsStyA1
def extract_urls(text)
    pattern = /((https|http|ftp):\/\/(www\.)?[\S]+[^.\s])/
    urls = text.scan pattern
    urls.each do |url|
        puts url[0]
    end
end

# sample_text = "Visit our site at http://www.example.org for more information. Check out our search page at https://example.com/search?q=ruby+regex. Don't forget to ftp our resources at ftp://example.com/resources."
# extract_urls(sample_text)
