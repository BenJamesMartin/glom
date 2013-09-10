##
# 
# Glom by Jackson Gariety
# Intelligent package search, inside your shell.
# 
# 1. `glom [@string]`
# 2. (initialize) Use environment-specific keywords from @string to get an array of @registries to search
# 3. (search) Search for @string in each of the @registries and join the results
# 4. (sort) Sort the JSON by ((stars * followers of top contributor) / issues)
# 5. (display) Print [title], [description], [top contributor], [stars], and [install command] into an ASCII table in terminal
#
# 1. `glom update`
# 2. Retreive the latest version of the JSON file

require "glom/version"
require "net/http"
require "json"

# Require individual registry logic
Dir["#{File.dirname(__FILE__)}/glom/registries/*.rb"].each { |file| require file }

class Glom
	def initialize(query)
	  @query = ARGV[0].dup
	
	  REGISTRIES.each do |registry, keywords|
	    keywords.each do |keyword|
	      if ARGV[0].include? keyword
	        (@registries ||= []) << registry
	        @query.slice! keyword
	        @query.strip!
	      end
	    end
	  end
	  
	  if defined? @registries then search @registries
	  else search REGISTRIES
	  end
	end
	
	def search(registries)
	  registries.each do |registry|
	    
      require registry.
      
      Kernel.const_get(registry.capitalize)
	  end
	end
	
	def sort
	end
	
	def display
	end
end