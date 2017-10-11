require 'set'
require 'matrix'

class Numbering
	attr_accessor :counter, :hsi, :nodes

  	def initialize
		@counter = -1
	  	@hsi = Hash.new
	  	@nodes = Set.new
	end

	def size
		nodes.length
	end

  	def add_element(node)
		unless hsi.has_key? :node
			@counter += 1
			@hsi[node]= size
			@nodes.add(node)
			return true
		end
		puts '>>>>>Numbering.add_element: ' + @nodes.to_a.map(&:inspect).to_s
	  	false
	end

  	def number(node)
		hsi[node]
	end

  	def element_at(i)
		nodes[i]
	end

end
