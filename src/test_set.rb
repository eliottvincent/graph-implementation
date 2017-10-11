require './node'
require './matrix_graph'

class TestSet
	node_one = Node.new('a', false)
	node_two = Node.new('b', false)
	node_three = Node.new('c', false)
	node_four = Node.new('d', false)
	node_five = Node.new('e', false)
	node_six = Node.new('a', false)

  	graph_matrix = MatrixGraph.new(5)
	puts graph_matrix.see

	graph_matrix.add_node(node_one)
	graph_matrix.add_node(node_two)
	graph_matrix.add_node(node_three)
	graph_matrix.add_node(node_four)
	graph_matrix.add_node(node_five)
	# graph_matrix.add_node(node_six)

	puts graph_matrix.see
	graph_matrix.add_arc(node_one, node_two)
	graph_matrix.add_arc(node_two, node_two)
	graph_matrix.add_arc(node_four, node_two)
	graph_matrix.add_arc(node_one, node_three)
	graph_matrix.add_arc(node_two, node_four)

  	puts graph_matrix.arc_exists(node_one, node_one)
  	puts graph_matrix.arc_exists(node_one, node_two)
  	puts graph_matrix.arc_value(node_one, node_two)
  	graph_matrix.edit_arc_value(node_one, node_two, 8)
  	puts graph_matrix.arc_value(node_one, node_two)
  	puts graph_matrix.arc_exists(node_one, node_two)

  	puts graph_matrix.see
  	p graph_matrix.neighbors(node_two)
  	puts graph_matrix.see
end
