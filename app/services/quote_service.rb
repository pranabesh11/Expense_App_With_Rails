class QuoteService
    include HTTParty
    base_uri 'api.quotable.io'
  
    def self.random_quote
      response = get('/quotes/random')
      if response.success?
        response.parsed_response
      else
        { error: "Unable to get quote" }
      end
    end
  end
