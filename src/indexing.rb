require 'set'
require 'matrix'

class Indexing
	attr_accessor :counter, :hsi, :nodes

  	def initialize
		@counter = -1
	  	@hsi = Hash.new
	  	@nodes = Hash.new
	end

	def size
		nodes.length
	end

  	def add_element(node)
		#puts '>>>>>Indexing.add_element()>>>>> starting: ' + @nodes.to_a.map(&:inspect).to_s
		unless has_element_private(node)
			@counter += 1
			@hsi[node]= size
			@nodes[node.name] = node
			#puts '>>>>>Indexing.add_element()>>>>> element added: ' + @nodes.to_a.map(&:inspect).to_s
			return true
		end
		#puts '>>>>>Indexing.add_element()>>>>> element already exist: ' + @nodes.to_a.map(&:inspect).to_s
	  	false
	end

	def has_element_private (node)
		@nodes[node.name]
	end

  	def index(node)
		@nodes.find_index { |k,_| k== node.name }
	end

  	def element_at(i)
		nodes[i]
	end

	private :has_element_private
end
