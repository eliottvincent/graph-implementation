require_relative 'graph'
require_relative'indexing'

class MatrixGraph < Graph

	attr_accessor :matrix

	def initialize(size = nil)
		super(size)	# calling the parent constructor
		@matrix = Matrix.zero(size.nil? ? 0 : size)	# matrix represents the adjacency matrix of the graph
	end




	#   ██████╗ ██████╗  █████╗ ██████╗ ██╗  ██╗
	#  ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗██║  ██║
	#  ██║  ███╗██████╔╝███████║██████╔╝███████║
	#  ██║   ██║██╔══██╗██╔══██║██╔═══╝ ██╔══██║
	#  ╚██████╔╝██║  ██║██║  ██║██║     ██║  ██║
	#   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝

	# Returns the size of the adjacency matrix representing the graph.
	#
	def size
		matrix.row_size
	end




	#  ███╗   ██╗ ██████╗ ██████╗ ███████╗
	#  ████╗  ██║██╔═══██╗██╔══██╗██╔════╝
	#  ██╔██╗ ██║██║   ██║██║  ██║█████╗
	#  ██║╚██╗██║██║   ██║██║  ██║██╔══╝
	#  ██║ ╚████║╚██████╔╝██████╔╝███████╗
	#  ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝

	# Adds a node to the current graph.
	#
	def add_node(node)
		if is_node(node)
			if indexing.add_element(node)
				if nb_nodes > size
					matrix.increment_size
				end
				return true
			else
				#raise ArgumentError, 'A similar node (same node object or same name) has already been added to the graph.'
				return false
			end
		end
		false
	end




	#   █████╗ ██████╗  ██████╗
	#  ██╔══██╗██╔══██╗██╔════╝
	#  ███████║██████╔╝██║
	#  ██╔══██║██╔══██╗██║
	#  ██║  ██║██║  ██║╚██████╗
	#  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝


	# Adds an arc between two nodes to the current graph. The origin and destination nodes are determined by the two arguments.
	#
	def add_arc(origin, destination, value = nil)
		if are_nodes_valid(origin, destination)
			oi = indexing.index_of(origin)
			di = indexing.index_of(destination)
			matrix[oi, di] = value.nil? ? 1 : value
			return true
		end
		false
	end

	# Adds an arc between two nodes to the current graph. The origin and destination nodes are determined by the two indexes in argument.
	#
	def add_arc_private(origin_index, destination_index, value = nil)
		origin_node = indexing.element_at(origin_index)
		destination_node = indexing.element_at(destination_index)
		if are_nodes_valid(origin_node, destination_node)

			matrix[origin_index, destination_index] = value.nil? ? 1 : value
			return true
		end
		false
	end

	# Checks if an arc between two nodes exist or not.
	# Returns true if so. return false if nil.
	#
	def arc_exists(origin, destination)
		if are_nodes_valid(origin, destination)
			oi = indexing.index_of(origin)
			di = indexing.index_of(destination)
			return matrix[oi, di] != 0
		end
		false
	end

	# Checks if the value at (oi, di) is different from 0
	# Returns true if so. return false if nil.
	#
	def arc_exists_private(origin_index, destination_index)
		origin_node = indexing.element_at(origin_index)
		destination_node = indexing.element_at(destination_index)
		if are_nodes_valid(origin_node, destination_node)
			return matrix[origin_index, destination_index] != 0
		end
		false
	end

	# Removes an arc.
	#
	def remove_arc(origin, destination)
		if arc_exists(origin, destination)
			oi = indexing.index_of(origin)
			di = indexing.index_of(destination)
			matrix[oi, di] = 0
			return true
		end
		false
	end

	# Returns the value of an Arc between origin and destination
	# If a value (3rd argument) is specified, the Arc between origin and destination will have this new value.
	#
	def arc_value(origin, destination, value = nil)
		if arc_exists(origin, destination)	# allowing to get/set only if the arc exist
			oi = indexing.index_of(origin)
			di = indexing.index_of(destination)
			if value.nil?
				return matrix[oi, di]
			else
				matrix[oi, di] = value
				return true
			end
		end
		if value.nil?
			-1
		else
			false
		end
	end

	# Returns the value of an Arc between origin and destination
	# If a value (3rd argument) is specified, the Arc between origin and destination will have this new value.
	#
	def arc_value_private(origin_index, destination_index, value = nil)
		if arc_exists_private(origin_index, destination_index) # allowing to get/set only if the arc exist
			if value.nil?
				return matrix[origin_index, destination_index]
			else
				matrix[origin_index, destination_index] = value
				return true
			end
		end
		if value.nil?
			-1
		else
			false
		end
	end




	#  ██╗    ██╗ █████╗ ██████╗ ███████╗██╗  ██╗ █████╗ ██╗     ██╗
	#  ██║    ██║██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██║     ██║
	#  ██║ █╗ ██║███████║██████╔╝███████╗███████║███████║██║     ██║
	#  ██║███╗██║██╔══██║██╔══██╗╚════██║██╔══██║██╔══██║██║     ██║
	#  ╚███╔███╔╝██║  ██║██║  ██║███████║██║  ██║██║  ██║███████╗███████╗
	#   ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝

	# Implementation of the Floyd-Warshall algorithm, using native matrix representation.
	#
	def warshall

		n = size	# n is the number of nodes of the graph

		(0..n-1).each{ |i|	# for each node of the graph
			(0..n-1).each{ |x|	# for each node of the graph
				if matrix[x, i] == 1	# if there is an arc between nodes at x and i
					(0..n-1).each {|y|	# for each node of the graph
						if matrix[i, y] == 1	# if there is an arc between nodes at i and y...
							matrix[x, y] = 1	# ...then we add an arc between x and y
						end
					}
				end
			}
		}
		puts 'Warshall done: '
		puts ''
		see
	end




	#  ███████╗ ██████╗ ██╗   ██╗██╗     ██╗  ██╗███████╗███████╗
	#  ██╔════╝██╔═══██╗██║   ██║██║     ██║ ██╔╝██╔════╝██╔════╝
	#  █████╗  ██║   ██║██║   ██║██║     █████╔╝ █████╗  ███████╗
	#  ██╔══╝  ██║   ██║██║   ██║██║     ██╔═██╗ ██╔══╝  ╚════██║
	#  ██║     ╚██████╔╝╚██████╔╝███████╗██║  ██╗███████╗███████║
	#  ╚═╝      ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝
	#

	# Implementation of the Foulkes algorithm, using native matrix.
	#
	def foulkes

		scc = Hash.new	# scc is an Hash representing a strongly connected component (cfc in french)
		n = size	# n is the number of nodes of the graph

		(0..n-1).each{ |i|
			node_i = indexing.element_at(i)	# getting the node at the current index
			unless is_node_marked(node_i) # if the node is still non explored...
				scc[node_i.name] = node_i # ...then we add it to the scc Hash
				mark_node(node_i) # ...and we mark it as explored
				if matrix[i, i] == 1 # if there is an arc between node_i and node_i...
					(i+1..n).each {|j| # ...then we loop on the nodes of the graph

						# if there is an arc between nodes at i and node at j...
						# ...and an arc between nodes at j and node at i...
						if matrix[i, j] == 1 && matrix[j, i] == 1
							node_j = indexing.element_at(j) # ...then we get the node at the j index
							scc[node_j.name] = node_j # we add it to the scc Hash
							mark_node(node_j) # and we mark it
						end
					}
				end
				p scc # displaying the scc in the console
				scc = Hash.new # emptying the scc Hash for the next iteration
			end
		}
		unmark_all_nodes	# removing the mark on all nodes
	end




	#  ██╗   ██╗████████╗██╗██╗     ███████╗
	#  ██║   ██║╚══██╔══╝██║██║     ██╔════╝
	#  ██║   ██║   ██║   ██║██║     ███████╗
	#  ██║   ██║   ██║   ██║██║     ╚════██║
	#  ╚██████╔╝   ██║   ██║███████╗███████║
	#   ╚═════╝    ╚═╝   ╚═╝╚══════╝╚══════╝

	# Outputs the content of the graph.
	#
	def see
		puts matrix.dump(@indexing.nodes.empty? ? nil : @indexing.nodes)
	end

end




# Overriding the Ruby Matrix object.
#
class Matrix

	# There is no method to pretty print a matrix so I created my own
	#
	def dump(elements = nil)
		str = ""
		space = " "
		double_space = space + space
		(0...self.row_size).each {|i|
			if i == 0
				str << space << "↗" << space << double_space

				# if elements has been specified, we output its content
				unless elements.nil?
					elements.each {|element|
						str << element[1].name.to_s << space
					}
				end
				str << "\n" << "\n"
			end

			if !elements.nil? && !elements.values[i].nil?
				if elements.values[i].name.to_s.size < 2
					str << space << elements.values[i].name.to_s << double_space
				else
					str << elements.values[i].name.to_s << double_space
				end
			else
				str << double_space << space
			end

			for j in 0...self.column_size
				str << space << self[i, j].to_s
			end
			str << "\n"
		}
		str << "\n"
	end

	# The Ruby Matrix object is immutable, however I want to be able to write:
	#   m[i,j] = v
	#
	def []=(i, j, v)
		@rows[i][j] = v
	end

	# The Matrix object doesn't let me to resize a matrix.
	#
	def increment_size
		incremented_size = row_count + 1

		@rows = Array.new(incremented_size){Array.new(incremented_size, 0)}	# adding a row and a column to the current Matrix
		@row_count = incremented_size	# incrementing the counter of rows
		@column_count = incremented_size	# incrementing the counter of columns
	end
end
