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
		if has_element(node)
			return false
		end
		@nodes[node.name] = node
		true
	end


	def remove_element(node)
		unless has_element(node)
			return false
		end
		@nodes[node.name] = nil
		true
	end

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

	# Imports elements from another indexing object.
	#
  	def import(indexing_to_import)
		indexing_to_import.nodes.each_with_index {|(key, value), index|
			add_element(value)
		}
	end
end
