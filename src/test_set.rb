require_relative 'node'
require_relative 'matrix_graph'

class TestSet

	# defining some nodes
	node_one = Node.new('a', false)
	node_two = Node.new('b', false)
	node_three = Node.new('c', false)
	node_four = Node.new('d', false)
	node_five = Node.new('e', false)
	node_six = Node.new('a', false)

	# defining a new graph, as a matrix, size 5
  	graph_matrix = MatrixGraph.new

	# viewing the graph
	puts graph_matrix.see

	# adding the nodes to the graph
	graph_matrix.add_node(node_one)
	graph_matrix.add_node(node_two)
	graph_matrix.add_node(node_three)
	graph_matrix.add_node(node_five)
	graph_matrix.add_node(node_four)
	# graph_matrix.add_node(node_six)

	# viewing the graph again
	puts graph_matrix.see

	# adding arcs between some nodes of the graph
	graph_matrix.add_arc(node_one, node_two)
	graph_matrix.add_arc(node_two, node_two)
	graph_matrix.add_arc(node_four, node_two)
	graph_matrix.add_arc(node_one, node_three)
	graph_matrix.add_arc(node_two, node_four)

	# viewing the graph again
  	puts graph_matrix.see

	# checking if the arc_exist method works
	puts graph_matrix.arc_value(node_one, node_two)
	graph_matrix.arc_value( node_two, node_two,8)
  	puts graph_matrix.arc_value(node_two, node_two)
	puts graph_matrix.see

	# getting the neighbors of a specific node
  	p graph_matrix.neighbors(node_two)

	graph_matrix_bis = graph_matrix.copy
  	puts graph_matrix_bis.see

  	puts graph_matrix.indegree(node_two)
	p graph_matrix.predecessors(node_two)
	puts graph_matrix.outdegree(node_two)
	p graph_matrix.successors(node_two)
end
