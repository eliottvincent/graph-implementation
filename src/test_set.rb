require_relative 'node'
require_relative 'matrix_graph'

class TestSet

	# defining some nodes
	node_a = Node.new('a')
	node_b = Node.new('b')
	node_c = Node.new('c')
	node_d = Node.new('d')
	node_e = Node.new('e')
	node_f = Node.new('f')
	node_g = Node.new('g')
	node_h = Node.new('h')
	node_i = Node.new('i')
	node_j = Node.new('j')
	node_k = Node.new('k')
	node_l = Node.new('l')

	# creating a new MatrixGraph
	my_graph = MatrixGraph.new

	# adding the nodes
	my_graph.add_node(node_a)
	my_graph.add_node(node_b)
	my_graph.add_node(node_c)
	my_graph.add_node(node_d)
	my_graph.add_node(node_e)
	my_graph.add_node(node_f)
	my_graph.add_node(node_g)
	my_graph.add_node(node_h)
	my_graph.add_node(node_i)
	my_graph.add_node(node_j)
	my_graph.add_node(node_k)
	my_graph.add_node(node_l)

	# viewing the graph with the nodes
	puts 'Nodes added:'
	puts ''
	puts my_graph.see

	my_graph.add_arc(node_a, node_l)
	my_graph.add_arc(node_b, node_a)
	my_graph.add_arc(node_b, node_c)
	my_graph.add_arc(node_c, node_j)
	my_graph.add_arc(node_d, node_e)
	my_graph.add_arc(node_d, node_f)
	my_graph.add_arc(node_e, node_d)
	my_graph.add_arc(node_e, node_f)
	my_graph.add_arc(node_f, node_c)
	my_graph.add_arc(node_f, node_i)
	my_graph.add_arc(node_g, node_h)
	my_graph.add_arc(node_g, node_i)
	my_graph.add_arc(node_h, node_g)
	my_graph.add_arc(node_i, node_j)
	my_graph.add_arc(node_j, node_i)
	my_graph.add_arc(node_k, node_j)
	my_graph.add_arc(node_l, node_b)
	my_graph.add_arc(node_l, node_c)

	# viewing the graph with the nodes and arcs
	puts 'Arcs added:'
	puts ''
	puts my_graph.see


	my_graph.warshall
	my_graph.foulkes

end
