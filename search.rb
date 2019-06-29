require 'rest-client'

class Search
    @@bing = "https://www.bing.com/search?q="
    def self.get_searching
        puts "Type the word you want to search: "
        query =gets.chomp
        search = Search.new query.split(' ').join('+')
    end
    def initialize(query)
        @query = query    
        @response = get_request  
        info
    end
    def info
       puts @response.headers    
       puts @response.code
       puts @response.cookies
       puts @response.body
       p @response.request  
    end
    private
    def get_request
        RestClient.get "#{@@bing}#{@query}"        
    end    
end

Search.get_searching