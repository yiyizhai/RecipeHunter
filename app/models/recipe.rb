class Recipe
	include HTTParty

	#default_options.update(verify: false)
	key_value = ENV['FOOD2FORK_KEY'] || "274275c10d69b5fad9fa3b3d2fb3eb0b"
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'food2fork.com'
	
	base_uri "http://food2fork.com/api"
	#base_uri "http://#{hostport}/api"
	default_params key: key_value 
	format :json

	def self.for term
		get("/search", query: {q: term})["recipes"]
	end
end

