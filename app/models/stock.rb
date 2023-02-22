class Stock < ApplicationRecord
	def self.new_lookup(ticker_symbol)
	    client = IEX::Api::Client.new(publishable_token: publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],secret_token: 'sk_f0ecad403440405a91067cfe29543358',endpoint: 'https://sandbox.iexapis.com/v1')
	    client.price(ticker_symbol)
	end
end
