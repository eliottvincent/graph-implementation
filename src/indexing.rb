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
		@nodes.length
	end

  	def add_element(node)
		#puts '>>>>>Indexing.add_element()>>>>> starting: ' + @nodes.to_a.map(&:inspect).to_s
		if has_element_private(node)
			false
		else
			@counter += 1
			@hsi[node]= size
			@nodes[node.name] = node
			#puts '>>>>>Indexing.add_element()>>>>> element added: ' + @nodes.to_a.map(&:inspect).to_s
			true
		end
		#puts '>>>>>Indexing.add_element()>>>>> element already exist: ' + @nodes.to_a.map(&:inspect).to_s
	end

	# check if the node specified in parameter is in the @nodes Hash
	# private method
	#
	def has_element_private(node)
		@nodes[node.name]
	end

	# returns the index of the node specified in parameter
	# the node is searched by it's name (node.name) since @nodes is a Hash
	#
  	def index(node)
		@nodes.find_index { |k,_| k== node.name }
	end

	# returns the node at the specified index
	# OK
  	def element_at(i)
		keys = nodes.keys
		nodes[keys[i]]
	end

	private :has_element_private
end
