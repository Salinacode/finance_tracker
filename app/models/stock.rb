class Stock < ApplicationRecord
	def self.new_lookup(ticker_symbol)
	    client = IEX::Api::Client.new(publishable_token: publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],secret_token: 'sk_f0ecad403440405a91067cfe29543358',endpoint: 'https://sandbox.iexapis.com/v1')
	    
	    begin
	    	new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.price(ticker_symbol))
	    rescue => exception
	    	return nil
	    end
	end
end
