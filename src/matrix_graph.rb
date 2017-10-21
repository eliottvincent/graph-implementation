require_relative 'graph'
require_relative'indexing'

class MatrixGraph < Graph

	attr_accessor :matrix, :indexing

	def initialize(size = nil)
		@indexing = Indexing.new						# indexing represents
		@matrix = Matrix.zero(size.nil? ? 0 : size)			# matrix represents the adjacency matrix of the graph
	end




	#   ██████╗ ██████╗  █████╗ ██████╗ ██╗  ██╗
	#  ██╔════╝ ██╔══██╗██╔══██╗██╔══██╗██║  ██║
	#  ██║  ███╗██████╔╝███████║██████╔╝███████║
	#  ██║   ██║██╔══██╗██╔══██║██╔═══╝ ██╔══██║
	#  ╚██████╔╝██║  ██║██║  ██║██║     ██║  ██║
	#   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝


	# Tells if a graph is null or not
	# A graph is considered as null when it has 0 nodes AND 0 arcs
	#
	def is_null
		if nb_nodes.eql?(0)
			return true
		end
		false
	end

	# Tells if a graph is empty or not
	# A graph is considered as null when it has n nodes AND 0 arcs
	#
	def is_empty
		if nb_arcs.eql?(0)
			return true
		end
		false
	end

	# Returns the size of the adjacency matrix representing the graph.
	#
	def size
		matrix.row_size
	end

	# Returns the number of nodes added to the graph.
	# Returns 0 if no nodes at all.
	#
	def nb_nodes
		indexing.size
	end

	# Returns the number of arcs added to the graph.
	# Returns 0 if no arcs at all.
	#
	def nb_arcs
		n = size
		nb = 0
		(0..n-1).each {|i|
			(0..n-1).each {|j|
				if arc_exists_private(i, j)
					nb += 1
				end
			}
		}
		nb
	end




	#  ███╗   ██╗ ██████╗ ██████╗ ███████╗
	#  ████╗  ██║██╔═══██╗██╔══██╗██╔════╝
	#  ██╔██╗ ██║██║   ██║██║  ██║█████╗
	#  ██║╚██╗██║██║   ██║██║  ██║██╔══╝
	#  ██║ ╚████║╚██████╔╝██████╔╝███████╗
	#  ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝

	# TODO: move some methods to Node?

	# Check if the node isn't nil and is a Node object
	#
	def is_node(node)
		!node.nil? && node.class == Node
	end

	#
	def is_node_in_graph(node)
		indexing.has_element(node)
	end

	# Checks if a node is valid and exists in the current graph
	#
	def is_node_valid(node)
		is_node(node) && is_node_in_graph(node)
	end

	# Calls the is_node_valid() method on two nodes
	#
	def are_nodes_valid(n1, n2)
		is_node_valid(n1) && is_node_valid(n2)
	end

	# Adds a node to the current graph.
	# Throws an error if the node has already been added to the graph
	#
	def add_node(node)
		if is_node(node)
			if indexing.add_element(node)
				arcs = Set.new
				if indexing.size > size
					matrix.increment_size
				end
			else
				raise ArgumentError, 'A similar node (same node object or same name) has already been added to the graph.'
			end
		end
	end

	# Returns the indegree value of the node in the current Graph
	# The indegree is the number of nodes reaching the specified node
	#
	def indegree(node)
		indegree = 0
		if is_node_valid(node)
			ni = indexing.index(node)
			(0..size - 1).each {|i|
				if arc_exists_private(i, ni)
					indegree += 1
				end
			}
		end
		indegree
	end

	# Returns the outdegree value of the node in the current Graph
	# The outdegree is the number of nodes reached by the specified node (through an arc)
	#
	def outdegree(node)
		outdegree = 0
		if is_node_valid(node)
			ni = indexing.index(node)
			(0..size - 1).each {|i|
				if arc_exists_private(ni, i)
					outdegree += 1
				end
			}
		end
		outdegree
	end

	# Returns a hash populated with all nodes reaching the specified node (through an arc)
	#
	def predecessors(node)
		predecessors = Hash.new
		if is_node_valid(node)
			ni = indexing.index(node)
			(0..size - 1).each {|i|
				if arc_exists_private(i, ni)
					predecessor = indexing.element_at(i)
					predecessors[predecessor.name] = predecessor
				end
			}
		end
		predecessors
	end

	# Returns a hash populated with all nodes reached by the specified node (through an arc)
	#
	def successors(node)
		successors = Hash.new
		if is_node_valid(node)
			ni = indexing.index(node)
			(0..size - 1).each {|i|
				if arc_exists_private(ni, i)
					successor = indexing.element_at(i)
					successors[successor.name] = successor
				end
			}
		end
		successors
	end

	# Returns the neighbors, which are all the nodes the specified node is connected to.
	#
	def neighbors(node)
		predecessors(node).merge(successors(node))
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

			oi = indexing.index(origin)
			di = indexing.index(destination)
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

			oi = indexing.index(origin)
			di = indexing.index(destination)

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
		if are_nodes_valid(origin, destination)
			if arc_exists(origin, destination)
				oi = indexing.index(origin)
				di = indexing.index(destination)
				matrix[oi, di] = 0
				return true
			else
			  return false
			end
		end
		false
	end

	# Returns the value of an Arc between origin and destination
	# If a value (3rd argument) is specified, the Arc between origin and destination will have this new value.
	#
	def arc_value(origin, destination, value = nil)
		if are_nodes_valid(origin, destination)
			if arc_exists(origin, destination)	# allowing to get/set only if the arc exist
				oi = indexing.index(origin)
				di = indexing.index(destination)
				if value.nil?
					return matrix[oi, di]
				else
					matrix[oi, di] = value
				  	return true
				end
			else
				return false
			end
		end
		false
	end

	# OK
	def arc_value_private(origin_index, destination_index, value = nil)
		origin_node = indexing.element_at(origin_index)
		destination_node = indexing.element_at(destination_index)

		if are_nodes_valid(origin_node, destination_node) # allowing to get/set only if the arc exist
			if value.nil?
				return matrix[origin_index, destination_index]
			else
				matrix[origin_node, destination_node] = value
			  	return true
			end
		end
	  	false
	end




	#  ██╗   ██╗████████╗██╗██╗     ███████╗
	#  ██║   ██║╚══██╔══╝██║██║     ██╔════╝
	#  ██║   ██║   ██║   ██║██║     ███████╗
	#  ██║   ██║   ██║   ██║██║     ╚════██║
	#  ╚██████╔╝   ██║   ██║███████╗███████║
	#   ╚═════╝    ╚═╝   ╚═╝╚══════╝╚══════╝

	# OK
	def copy
		n = size
		g = MatrixGraph.new(n)
		(0..n-1).each {|i|
			node_to_add = indexing.element_at(i)
			unless node_to_add.nil?
				g.add_node(node_to_add)
			end
		}
		(0..n-1).each {|i|
			(0..n-1).each {|j|
				if arc_exists_private(i, j)
					g.add_arc_private(i, j, arc_value_private(i, j))
				end
			}
		}
		g
	end

	def see
		puts matrix.dump(@indexing.nodes.empty? ? nil : @indexing.nodes)
	end




	#   █████╗ ██╗      ██████╗  ██████╗ ██████╗ ██╗████████╗██╗  ██╗███╗   ███╗███████╗
	#  ██╔══██╗██║     ██╔════╝ ██╔═══██╗██╔══██╗██║╚══██╔══╝██║  ██║████╗ ████║██╔════╝
	#  ███████║██║     ██║  ███╗██║   ██║██████╔╝██║   ██║   ███████║██╔████╔██║███████╗
	#  ██╔══██║██║     ██║   ██║██║   ██║██╔══██╗██║   ██║   ██╔══██║██║╚██╔╝██║╚════██║
	#  ██║  ██║███████╗╚██████╔╝╚██████╔╝██║  ██║██║   ██║   ██║  ██║██║ ╚═╝ ██║███████║
	#  ╚═╝  ╚═╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝

	def warshall

	end



end




# overriding the Matrix class defining the Matrix object in Ruby 2.4.2
#
class Matrix

	# there is no method to pretty print a matrix
	#
	def dump(elements = nil)
		# p self
		str = ""
		space = " "
		double_space = space + space
		(0...self.row_size).each {|i|
			if i == 0
				str << "↗" << space << double_space

				# if elements has been specified, we output its content
				unless elements.nil?
					elements.each {|element|
						str << element[1].name.to_s << space
					}
				end
				str << "\n" << "\n"
			end

			if !elements.nil? && !elements.values[i].nil?
				str << elements.values[i].name.to_s << double_space
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

	# the Matrix class is immutable, however I want to be able to write:
	#   m[i,j] = v
	#
	def []=(i, j, v)
		@rows[i][j] = v
	end

	# the Matrix class doesn't let developers resize a matrix
	#
	def increment_size
		incremented_size = row_count + 1

		@rows = Array.new(incremented_size){Array.new(incremented_size, 0)}
		@row_count = incremented_size
		@column_count = incremented_size
	end
end
