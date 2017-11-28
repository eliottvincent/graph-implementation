require_relative 'node'
require_relative 'matrix_graph'

class TestSet

	# defining some nodes
	node_one = Node.new('a', false)
	node_two = Node.new('b', false)
	node_three = Node.new('c', false)
	node_four = Node.new('d', false)
	node_five = Node.new('e', false)

	# defining a new graph, as a matrix, size 5
  	graph_matrix = MatrixGraph.new

	# viewing the graph
	puts graph_matrix.see

	# adding the nodes to the graph
	graph_matrix.add_node(node_one)
	graph_matrix.add_node(node_two)
	graph_matrix.add_node(node_three)
	graph_matrix.add_node(node_four)
	graph_matrix.add_node(node_five)
	#graph_matrix.add_node(node_six)

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



	puts '########################################################################################################################'

	graph_matrix_warshall_one = MatrixGraph.new

	first_node = Node.new('1')
	second_node = Node.new('2')
	third_node = Node.new('3')
	fourth_node = Node.new('4')
	fifth_node = Node.new('5')
	sixth_node = Node.new('6')

	graph_matrix_warshall_one.add_node(first_node)
	graph_matrix_warshall_one.add_node(second_node)
	graph_matrix_warshall_one.add_node(third_node)
	graph_matrix_warshall_one.add_node(fourth_node)

	graph_matrix_warshall_one.add_arc(first_node, second_node)
	graph_matrix_warshall_one.add_arc(second_node, third_node)
	graph_matrix_warshall_one.add_arc(third_node, fourth_node)

	puts graph_matrix_warshall_one.see
	graph_matrix_warshall_one.warshall
	puts graph_matrix_warshall_one.see

	puts '########################################################################################################################'

	graph_matrix_warshall_two = MatrixGraph.new

	graph_matrix_warshall_two.add_node(first_node)
	graph_matrix_warshall_two.add_node(second_node)
	graph_matrix_warshall_two.add_node(third_node)
	graph_matrix_warshall_two.add_node(fourth_node)

	graph_matrix_warshall_two.add_arc(first_node, second_node)
	graph_matrix_warshall_two.add_arc(second_node, third_node)
	graph_matrix_warshall_two.add_arc(third_node, fourth_node)
	graph_matrix_warshall_two.add_arc(third_node, second_node)

	puts graph_matrix_warshall_two.see
	graph_matrix_warshall_two.warshall
	puts graph_matrix_warshall_two.see

	puts '########################################################################################################################'

	graph_matrix_warshall_three = MatrixGraph.new

	graph_matrix_warshall_three.add_node(first_node)
	graph_matrix_warshall_three.add_node(second_node)
	graph_matrix_warshall_three.add_node(third_node)
	graph_matrix_warshall_three.add_node(fourth_node)
	graph_matrix_warshall_three.add_node(fifth_node)
	graph_matrix_warshall_three.add_node(sixth_node)

	graph_matrix_warshall_three.add_arc(first_node, fourth_node)
	graph_matrix_warshall_three.add_arc(first_node, second_node)
	graph_matrix_warshall_three.add_arc(second_node, third_node)
	graph_matrix_warshall_three.add_arc(second_node, fifth_node)
	graph_matrix_warshall_three.add_arc(third_node, fifth_node)
	graph_matrix_warshall_three.add_arc(fourth_node, third_node)
	graph_matrix_warshall_three.add_arc(fifth_node, fourth_node)
	graph_matrix_warshall_three.add_arc(sixth_node, third_node)
	graph_matrix_warshall_three.add_arc(sixth_node, fifth_node)

	puts graph_matrix_warshall_three.see
	graph_matrix_warshall_three.warshall_matrix_native
	puts graph_matrix_warshall_three.see

	puts '########################################################################################################################'

	node_one = Node.new('1', false)
	node_two = Node.new('2', false)
	node_three = Node.new('3', false)
	node_four = Node.new('4', false)
	node_five = Node.new('5', false)
	node_six = Node.new('6', false)
	node_seven = Node.new('7', false)
	node_eight = Node.new('8', false)
	node_nine = Node.new('9', false)
	node_ten = Node.new('10', false)
	node_eleven = Node.new('11', false)
	node_twelve = Node.new('12', false)

	graph_matrix_foulkes_one = MatrixGraph.new

	graph_matrix_foulkes_one.add_node(node_one)
	graph_matrix_foulkes_one.add_node(node_two)
	graph_matrix_foulkes_one.add_node(node_three)
	graph_matrix_foulkes_one.add_node(node_four)
	graph_matrix_foulkes_one.add_node(node_five)
	graph_matrix_foulkes_one.add_node(node_six)
	graph_matrix_foulkes_one.add_node(node_seven)
	graph_matrix_foulkes_one.add_node(node_eight)
	graph_matrix_foulkes_one.add_node(node_nine)
	graph_matrix_foulkes_one.add_node(node_ten)
	graph_matrix_foulkes_one.add_node(node_eleven)
	graph_matrix_foulkes_one.add_node(node_twelve)

	graph_matrix_foulkes_one.add_arc(node_one, node_twelve)
	graph_matrix_foulkes_one.add_arc(node_two, node_one)
	graph_matrix_foulkes_one.add_arc(node_two, node_three)
	graph_matrix_foulkes_one.add_arc(node_three, node_ten)
	graph_matrix_foulkes_one.add_arc(node_four, node_five)
	graph_matrix_foulkes_one.add_arc(node_four, node_six)
	graph_matrix_foulkes_one.add_arc(node_five, node_four)
	graph_matrix_foulkes_one.add_arc(node_five, node_six)
	graph_matrix_foulkes_one.add_arc(node_six, node_three)
	graph_matrix_foulkes_one.add_arc(node_six, node_nine)
	graph_matrix_foulkes_one.add_arc(node_seven, node_eight)
	graph_matrix_foulkes_one.add_arc(node_seven, node_nine)
	graph_matrix_foulkes_one.add_arc(node_eight, node_seven)
	graph_matrix_foulkes_one.add_arc(node_nine, node_ten)
	graph_matrix_foulkes_one.add_arc(node_ten, node_nine)
	graph_matrix_foulkes_one.add_arc(node_eleven, node_ten)
	graph_matrix_foulkes_one.add_arc(node_twelve, node_two)
	graph_matrix_foulkes_one.add_arc(node_twelve, node_three)

	puts graph_matrix_foulkes_one.see
	graph_matrix_foulkes_one.warshall_matrix_native
  	puts graph_matrix_foulkes_one.see
	graph_matrix_foulkes_one.foulkes_matrix_native

end
