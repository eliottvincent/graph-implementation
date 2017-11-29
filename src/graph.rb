class Graph

	attr_accessor :size, :copy, :indexing

	def initialize(size = nil)
		@indexing = Indexing.new	# indexing represents the indexing layer of the graph
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

	# Returns the size of the data type representing the graph.
	#
	def size

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

	# Checks if the node isn't nil and is a Node object.
	#
	def is_node(node)
		!node.nil? && node.class == Node
	end

	# Checks if the node exists in the current graph.
	#
	def is_node_in_graph(node)
		indexing.has_element(node)
	end

	# Checks if a node is valid and exists in the current graph.
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

	end

	# Removes a node from the current graph.
	# Throws an error if the node isn't invalid (non Node object or not in the graph).
	#
	def remove_node(node)
		if is_node(node)
			indexing.remove_element(node)
			true
		else
			#raise ArgumentError, 'The node is invalid (non Node object or node isn\'t in the graph)'
			false
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
			return indegree
		end
		-1
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
			return outdegree
		end
		-1
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

	end

	# Adds an arc between two nodes to the current graph. The origin and destination nodes are determined by the two indexes in argument.
	#
	def add_arc_private(origin_index, destination_index, value = nil)

	end

	# Checks if an arc between two nodes exist or not.
	# Returns true if so. return false if nil.
	#
	def arc_exists(origin, destination)

	end

	# Checks if the value at (oi, di) is different from 0
	# Returns true if so. return false if nil.
	#
	def arc_exists_private(origin_index, destination_index)

	end

	# Removes an arc.
	#
	def remove_arc(origin, destination)

	end

	# Returns the value of an Arc between origin and destination
	# If a value (3rd argument) is specified, the Arc between origin and destination will have this new value.
	#
	def arc_value(origin, destination, value = nil)

	end

	# Returns the value of an Arc between origin and destination
	# If a value (3rd argument) is specified, the Arc between origin and destination will have this new value.
	#
	def arc_value_private(origin_index, destination_index, value = nil)

	end




	#  ███████╗██╗      ██████╗ ██╗   ██╗██████╗       ██╗    ██╗ █████╗ ██████╗ ███████╗██╗  ██╗ █████╗ ██╗     ██╗
	#  ██╔════╝██║     ██╔═══██╗╚██╗ ██╔╝██╔══██╗      ██║    ██║██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██║     ██║
	#  █████╗  ██║     ██║   ██║ ╚████╔╝ ██║  ██║█████╗██║ █╗ ██║███████║██████╔╝███████╗███████║███████║██║     ██║
	#  ██╔══╝  ██║     ██║   ██║  ╚██╔╝  ██║  ██║╚════╝██║███╗██║██╔══██║██╔══██╗╚════██║██╔══██║██╔══██║██║     ██║
	#  ██║     ███████╗╚██████╔╝   ██║   ██████╔╝      ╚███╔███╔╝██║  ██║██║  ██║███████║██║  ██║██║  ██║███████╗███████╗
	#  ╚═╝     ╚══════╝ ╚═════╝    ╚═╝   ╚═════╝        ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝

	# Implementation of the Floyd-Warshall algorithm.
	# This implementation uses high level methods that are specific to each Graph type (matrix, list, etc.)
	#
	def warshall

		n = self.size	# n is the number of nodes of the graph

		(0..n-1).each{ |i|
			(0..n-1).each{ |x|
				if self.arc_exists_private(x, i)
					(0..n-1).each {|y|
						if self.arc_exists_private(i, y)
							self.add_arc_private(x, y)
						end
					}
				end
			}
		}
	end


	#  ███████╗ ██████╗ ██╗   ██╗██╗     ██╗  ██╗███████╗███████╗
	#  ██╔════╝██╔═══██╗██║   ██║██║     ██║ ██╔╝██╔════╝██╔════╝
	#  █████╗  ██║   ██║██║   ██║██║     █████╔╝ █████╗  ███████╗
	#  ██╔══╝  ██║   ██║██║   ██║██║     ██╔═██╗ ██╔══╝  ╚════██║
	#  ██║     ╚██████╔╝╚██████╔╝███████╗██║  ██╗███████╗███████║
	#  ╚═╝      ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝
	#

	# Implementation of the Foulkes algorithm, using native matrix.
	# This implementation uses high level methods that are specific to each Graph type (matrix, list, etc.)
	#
	def foulkes

		scc = Hash.new	# scc is an Hash representing a strongly connected component (cfc in french)
		ne = getNE	# ne represents the list of nodes that are still not explored
		n = self.size	# ne is the number of nodes of the graph

		(0..n-1).each{ |i|
			node_i = ne.element_at(i)	# getting the node at the current index
			if ne.has_element(node_i)	# if the node is still non explored...
				scc[node_i.name] = node_i	# ...then we add it to the scc Hash
				ne.remove_element(node_i)	# ...and we remove it from the list of non explored nodes
				if arc_exists_private(i, i)	# if there is an arc between node_i and node_i...
					(i+1..n).each{|j|	# ...then we loop on the nodes of the grap

						# if there is an arc between nodes at i and node at j...
						# ...and an arc between nodes at j and node at i...
						if arc_exists_private(i, j) && arc_exists_private(j, i)
							node_j = indexing.element_at(j)	# ...then we get the node at the j index
							scc[node_j.name] = node_j	# we add it to tje scc Hash
							ne.remove_element(node_j)	# and we remove it from the list of non explored nodes
						end
					}
				end
				p scc	# displaying the scc in the console
				scc = Hash.new	# emptying the scc Hash for the next iteration
			end
		}
	end


	#  ██╗   ██╗████████╗██╗██╗     ███████╗
	#  ██║   ██║╚══██╔══╝██║██║     ██╔════╝
	#  ██║   ██║   ██║   ██║██║     ███████╗
	#  ██║   ██║   ██║   ██║██║     ╚════██║
	#  ╚██████╔╝   ██║   ██║███████╗███████║
	#   ╚═════╝    ╚═╝   ╚═╝╚══════╝╚══════╝

	# Copies a graph.
	#
	def copy
		n = size
		g = Graph.new(n)
		(0..n-1).each { |i|
			node_to_add = indexing.element_at(i)
			unless node_to_add.nil?
				g.add_node(node_to_add)
			end
		}
		(0..n-1).each { |i|
			(0..n-1).each { |j|
				if arc_exists_private(i, j)
					g.add_arc_private(i, j, arc_value_private(i, j))
				end
			}
		}
		g
	end

	def see

	end

	# Duplicating indexing so we can manipulate it without affecting the graph
	#
	def getNE
		ne = Indexing.new
		ne.import(indexing)
		ne
	end
end
