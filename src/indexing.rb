require 'set'
require 'matrix'

class Indexing
	attr_accessor :counter, :nodes

	def initialize
		@nodes = Hash.new
	end

	# Returns the size of the nodes Hash
	#
	def size
		@nodes.length
	end

	# Checks if the node specified in parameter is in the @nodes Hash
	#
	def has_element(node)
		if is_node(node)
			@nodes.each_with_index { |(key,value), index|
				if key == node.name && value.eql?(node)
					return true
				end
			}
		end
		false
	end

	# Adds a node in the @nodes Hash.
	#
	def add_element(node)
		if has_element(node)
			return false
		end
		@nodes[node.name] = node
		true
	end

	# Deletes the node from @nodes.
	#
	def remove_element(node)
		unless has_element(node)
			return false
		end
		@nodes[node.name] = nil
		true
	end

	# Checks if the node isn't nil and is a Node object.
	#
	def is_node(node)
		!node.nil? && node.class == Node
	end

	# Returns the index of the node specified in parameter
	#
	def index_of(node)
		if is_node(node)
			@nodes.each_with_index {|(key, value), index|
				if key == node.name && value.eql?(node)
					return index
				end
			}
			return -1
		end
		-1
	end

	# Returns the node at the specified index
	#
	def element_at(i)
		nodes[nodes.keys[i]]
	end
end
