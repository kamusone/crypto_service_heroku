require 'rubygems'
require 'nokogiri'
require 'open-uri'

class StartScrap
attr_accessor :url
    def initialize
        @url = "https://coinmarketcap.com/all/views/all/"
    end

    def names
      @names = []
      count= 0
        doc = Nokogiri::HTML(open(@url)).css(".currency-name-container").each do |name|
            @names.push(name.text)
            count +=1
            break if count > 5
        end
        return @names
    end

    def price
      count= 0
      @price = []
        doc = Nokogiri::HTML(open(@url)).css(".price").each do |price|
            @price.push(price.text)
            count +=1
            break if count > 5
        end
        return @price
    end

    def save(hash)
      CreateCrypto.delete_all
      hash.each do |names, price|
        CreateCrypto.create(name: names, value: price)
      end
    end

    def perform
        hash = Hash[names.zip(price)]
        save(hash)
        hash
    end

end
