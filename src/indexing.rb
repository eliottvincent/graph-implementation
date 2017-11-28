require 'set'
require 'matrix'

class Indexing
	attr_accessor :counter, :nodes

	def initialize
		@nodes = Hash.new
	end


	def size
		@nodes.length
	end


	# check if the node specified in parameter is in the @nodes Hash
	#
	def has_element(node)
		if is_node_valid(node)
			@nodes.each_with_index { |(key,value), index|
				if key == node.name && value.eql?(node)
					return true
				end
			}
		end
		false
	end


	def add_element(node)
		#puts '>>>>>Indexing.add_element()>>>>> starting: ' + @nodes.to_a.map(&:inspect).to_s
		if has_element(node)
			return false
		end
		@nodes[node.name] = node
		#puts '>>>>>Indexing.add_element()>>>>> element added: ' + @nodes.to_a.map(&:inspect).to_s
		true
		#puts '>>>>>Indexing.add_element()>>>>> element already exist: ' + @nodes.to_a.map(&:inspect).to_s
	end


	def remove_element(node)
		unless has_element(node)
			return false
		end
		@nodes[node.name] = nil
		true
	end


	# TODO: move this to Node class?
	def is_node_valid(node)
		!node.nil? && node.class == Node
	end

	# returns the index of the node specified in parameter
	# the node is searched by it's name (node.name) since @nodes is a Hash
	#
	def index(node)
		if is_node_valid(node)
			@nodes.each_with_index {|(key, value), index|
				if key == node.name && value.eql?(node)
					return index
				end
			}
			return -1
		end
		-1
	end

	# returns the node at the specified index
	#
	def element_at(i)
		nodes[nodes.keys[i]]
	end

	# private :has_element_private
end
