require 'minitest/autorun'
require 'shoulda/context'
require_relative './../src/matrix_graph'
require_relative './../src/node'
require_relative './../src/arc'

class TestGraphMatrix < Minitest::Test

	# allow the tests to be ran ordered
	# i_suck_and_my_tests_are_order_dependent!
	def self.test_order
		:alpha
	end

	graph_matrix = nil
	graph_matrix_size = nil
	size = 5

	node_one = nil
	node_two = nil
	node_three = nil
	node_four = nil
	node_five = nil
	node_six = nil
	node_seven = nil
	node_eight = nil

	node_one_index = nil
	node_two_index = nil
	node_three_index = nil
	node_four_index = nil
	node_five_index = nil
	node_six_index = nil
	node_seven_index = nil
	node_eight_index = nil

	node_one_predecessors = Hash.new
	node_two_predecessors = Hash.new
	node_three_predecessors = Hash.new
	node_four_predecessors = Hash.new
	node_five_predecessors = Hash.new
	node_six_predecessors = Hash.new
	node_seven_predecessors = Hash.new
	node_eight_predecessors = Hash.new

	node_one_successors = Hash.new
	node_two_successors = Hash.new
	node_three_successors = Hash.new
	node_four_successors = Hash.new
	node_five_successors = Hash.new
	node_six_successors = Hash.new
	node_seven_successors = Hash.new
	node_eight_successors = Hash.new

	node_one_neighbors= Hash.new
	node_two_neighbors= Hash.new
	node_three_neighbors= Hash.new
	node_four_neighbors= Hash.new
	node_five_neighbors= Hash.new
	node_six_neighbors= Hash.new
	node_seven_neighbors= Hash.new
	node_eight_neighbors= Hash.new


	#  ██╗███╗   ██╗██╗████████╗
	#  ██║████╗  ██║██║╚══██╔══╝
	#  ██║██╔██╗ ██║██║   ██║
	#  ██║██║╚██╗██║██║   ██║
	#  ██║██║ ╚████║██║   ██║
	#  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝


	context 'A.1: initializing the graphs' do

		setup do
			graph_matrix = MatrixGraph.new
			graph_matrix_size = MatrixGraph.new(size)
		end


		should 'the graph is created properly' do
			assert_equal MatrixGraph, graph_matrix.class
			assert_equal MatrixGraph, graph_matrix_size.class
		end

	end

	context 'A.2: checking Graph methods' do

		should 'size works properly' do
			assert_equal 0, graph_matrix.size
			assert_equal size, graph_matrix_size.size
		end

		should 'is_null works properly' do
			assert_equal true, graph_matrix.is_null
			assert_equal true, graph_matrix_size.is_null
		end

		should 'is_empty works properly' do
			assert_equal true, graph_matrix.is_empty
			assert_equal true, graph_matrix_size.is_empty
		end

		should 'nb_nodes works properly' do
			assert_equal 0, graph_matrix.nb_nodes
			assert_equal 0, graph_matrix_size.nb_nodes
		end

		should 'nb_arcs works properly' do
			assert_equal 0, graph_matrix.nb_arcs
			assert_equal 0, graph_matrix_size.nb_arcs
		end

	end





	#  ███╗   ██╗ ██████╗ ██████╗ ███████╗███████╗
	#  ████╗  ██║██╔═══██╗██╔══██╗██╔════╝██╔════╝
	#  ██╔██╗ ██║██║   ██║██║  ██║█████╗  ███████╗
	#  ██║╚██╗██║██║   ██║██║  ██║██╔══╝  ╚════██║
	#  ██║ ╚████║╚██████╔╝██████╔╝███████╗███████║
	#  ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝


	context 'B.1: defining some nodes' do

		setup do
			node_one = Node.new('a', false)
			node_two = Node.new('b', false)
			node_three = Node.new('c', false)
			node_four = Node.new('d', false)
			node_five = Node.new('e', false)
			node_six = Node.new('a', false)
			node_seven = nil
			node_eight = String.new
		end

		should 'is_node works properly' do
			assert_equal true, graph_matrix.is_node(node_one)
			assert_equal true, graph_matrix.is_node(node_two)
			assert_equal true, graph_matrix.is_node(node_three)
			assert_equal true, graph_matrix.is_node(node_four)
			assert_equal true, graph_matrix.is_node(node_five)
			assert_equal true, graph_matrix.is_node(node_six)
			assert_equal false, graph_matrix.is_node(node_seven)
			assert_equal false, graph_matrix.is_node(node_eight)
		end

	end

	context 'B.2: adding the nodes to the Graph' do

		setup do
			@node_one_adding = graph_matrix.add_node(node_one)
			@node_two_adding = graph_matrix.add_node(node_two)
			@node_three_adding = graph_matrix.add_node(node_three)
			@node_four_adding = graph_matrix.add_node(node_four)
			@node_five_adding = graph_matrix.add_node(node_five)
			@node_seven_adding = graph_matrix.add_node(node_seven)
			@node_eight_adding = graph_matrix.add_node(node_eight)
		end

		should 'add_node works properly' do
			assert_equal true, @node_one_adding
			assert_equal true, @node_two_adding
			assert_equal true, @node_three_adding
			assert_equal true, @node_four_adding
			assert_equal true, @node_five_adding
			assert_equal false, @node_seven_adding
			assert_equal false, @node_eight_adding
		end

		should 'is_node_in_graph works properly' do
			assert_equal true, graph_matrix.is_node_in_graph(node_one)
			assert_equal true, graph_matrix.is_node_in_graph(node_two)
			assert_equal true, graph_matrix.is_node_in_graph(node_three)
			assert_equal true, graph_matrix.is_node_in_graph(node_four)
			assert_equal true, graph_matrix.is_node_in_graph(node_five)
			assert_equal false, graph_matrix.is_node_in_graph(node_six)
			assert_equal false, graph_matrix.is_node_in_graph(node_seven)
			assert_equal false, graph_matrix.is_node_in_graph(node_eight)
		end

		should 'is_node_valid works properly' do
			assert_equal true, graph_matrix.is_node_valid(node_one)
			assert_equal true, graph_matrix.is_node_valid(node_two)
			assert_equal true, graph_matrix.is_node_valid(node_three)
			assert_equal true, graph_matrix.is_node_valid(node_four)
			assert_equal true, graph_matrix.is_node_valid(node_five)
			assert_equal false, graph_matrix.is_node_valid(node_six)
			assert_equal false, graph_matrix.is_node_valid(node_seven)
			assert_equal false, graph_matrix.is_node_valid(node_eight)
		end

		should 'the are_nodes_valid method works properly' do
			assert_equal true, graph_matrix.are_nodes_valid(node_one, node_one)
			assert_equal true, graph_matrix.are_nodes_valid(node_one, node_two)
			assert_equal true, graph_matrix.are_nodes_valid(node_one, node_three)
			assert_equal true, graph_matrix.are_nodes_valid(node_one, node_four)
			assert_equal true, graph_matrix.are_nodes_valid(node_one, node_five)
			assert_equal false, graph_matrix.are_nodes_valid(node_one, node_six)
			assert_equal false, graph_matrix.are_nodes_valid(node_one, node_seven)
			assert_equal false, graph_matrix.are_nodes_valid(node_one, node_eight)

			assert_equal true, graph_matrix.are_nodes_valid(node_two, node_one)
			assert_equal true, graph_matrix.are_nodes_valid(node_two, node_two)
			assert_equal true, graph_matrix.are_nodes_valid(node_two, node_three)
			assert_equal true, graph_matrix.are_nodes_valid(node_two, node_four)
			assert_equal true, graph_matrix.are_nodes_valid(node_two, node_five)
			assert_equal false, graph_matrix.are_nodes_valid(node_two, node_six)
			assert_equal false, graph_matrix.are_nodes_valid(node_two, node_seven)
			assert_equal false, graph_matrix.are_nodes_valid(node_two, node_eight)

			assert_equal true, graph_matrix.are_nodes_valid(node_three, node_one)
			assert_equal true, graph_matrix.are_nodes_valid(node_three, node_two)
			assert_equal true, graph_matrix.are_nodes_valid(node_three, node_three)
			assert_equal true, graph_matrix.are_nodes_valid(node_three, node_four)
			assert_equal true, graph_matrix.are_nodes_valid(node_three, node_five)
			assert_equal false, graph_matrix.are_nodes_valid(node_three, node_six)
			assert_equal false, graph_matrix.are_nodes_valid(node_three, node_seven)
			assert_equal false, graph_matrix.are_nodes_valid(node_three, node_eight)

			assert_equal true, graph_matrix.are_nodes_valid(node_four, node_one)
			assert_equal true, graph_matrix.are_nodes_valid(node_four, node_two)
			assert_equal true, graph_matrix.are_nodes_valid(node_four, node_three)
			assert_equal true, graph_matrix.are_nodes_valid(node_four, node_four)
			assert_equal true, graph_matrix.are_nodes_valid(node_four, node_five)
			assert_equal false, graph_matrix.are_nodes_valid(node_four, node_six)
			assert_equal false, graph_matrix.are_nodes_valid(node_four, node_seven)
			assert_equal false, graph_matrix.are_nodes_valid(node_four, node_eight)

			assert_equal true, graph_matrix.are_nodes_valid(node_five, node_one)
			assert_equal true, graph_matrix.are_nodes_valid(node_five, node_two)
			assert_equal true, graph_matrix.are_nodes_valid(node_five, node_three)
			assert_equal true, graph_matrix.are_nodes_valid(node_five, node_four)
			assert_equal true, graph_matrix.are_nodes_valid(node_five, node_five)
			assert_equal false, graph_matrix.are_nodes_valid(node_five, node_six)
			assert_equal false, graph_matrix.are_nodes_valid(node_five, node_seven)
			assert_equal false, graph_matrix.are_nodes_valid(node_five, node_eight)

			assert_equal false, graph_matrix.are_nodes_valid(node_six, node_one)
			assert_equal false, graph_matrix.are_nodes_valid(node_six, node_two)
			assert_equal false, graph_matrix.are_nodes_valid(node_six, node_three)
			assert_equal false, graph_matrix.are_nodes_valid(node_six, node_four)
			assert_equal false, graph_matrix.are_nodes_valid(node_six, node_five)
			assert_equal false, graph_matrix.are_nodes_valid(node_six, node_six)
			assert_equal false, graph_matrix.are_nodes_valid(node_six, node_seven)
			assert_equal false, graph_matrix.are_nodes_valid(node_six, node_eight)

			assert_equal false, graph_matrix.are_nodes_valid(node_seven, node_one)
			assert_equal false, graph_matrix.are_nodes_valid(node_seven, node_two)
			assert_equal false, graph_matrix.are_nodes_valid(node_seven, node_three)
			assert_equal false, graph_matrix.are_nodes_valid(node_seven, node_four)
			assert_equal false, graph_matrix.are_nodes_valid(node_seven, node_five)
			assert_equal false, graph_matrix.are_nodes_valid(node_seven, node_six)
			assert_equal false, graph_matrix.are_nodes_valid(node_seven, node_seven)
			assert_equal false, graph_matrix.are_nodes_valid(node_seven, node_eight)

			assert_equal false, graph_matrix.are_nodes_valid(node_eight, node_one)
			assert_equal false, graph_matrix.are_nodes_valid(node_eight, node_two)
			assert_equal false, graph_matrix.are_nodes_valid(node_eight, node_three)
			assert_equal false, graph_matrix.are_nodes_valid(node_eight, node_four)
			assert_equal false, graph_matrix.are_nodes_valid(node_eight, node_five)
			assert_equal false, graph_matrix.are_nodes_valid(node_eight, node_six)
			assert_equal false, graph_matrix.are_nodes_valid(node_eight, node_seven)
			assert_equal false, graph_matrix.are_nodes_valid(node_eight, node_eight)
		end

		should 'is_null doesn\'t return true anymore' do
			refute_equal true, graph_matrix.is_null
		end

		should 'is_null returns false because we added nodes' do
			assert_equal false, graph_matrix.is_null
		end

		should 'size doesn\'t return 0 anymore' do
			refute_equal 0, graph_matrix.size
		end

		should 'size now returns 5 because we added 5 nodes' do
			assert_equal 5, graph_matrix.size
		end

		should 'nb_nodes doesn\'t return 0 anymore' do
			refute_equal 0, graph_matrix.nb_nodes
		end

		should 'nb_nodes returns 5 because we added 5 nodes' do
			assert_equal 5, graph_matrix.nb_nodes
		end

		should 'nb_arcs still returns 0' do
			assert_equal 0, graph_matrix.nb_arcs
		end

	end

	context 'B.3: adding nodes to a MatrixGraph object' do

		should 'indegree works properly (returns 0 for every node (no arcs))' do
			assert_equal 0, graph_matrix.indegree(node_one)
			assert_equal 0, graph_matrix.indegree(node_two)
			assert_equal 0, graph_matrix.indegree(node_three)
			assert_equal 0, graph_matrix.indegree(node_four)
			assert_equal 0, graph_matrix.indegree(node_five)
			assert_equal -1, graph_matrix.indegree(node_six)
			assert_equal -1, graph_matrix.indegree(node_seven)
			assert_equal -1, graph_matrix.indegree(node_eight)
		end

		should 'the outdegree method returns 0 for every node (no arcs)' do
			assert_equal 0, graph_matrix.outdegree(node_one)
			assert_equal 0, graph_matrix.outdegree(node_two)
			assert_equal 0, graph_matrix.outdegree(node_three)
			assert_equal 0, graph_matrix.outdegree(node_four)
			assert_equal 0, graph_matrix.outdegree(node_five)
			assert_equal -1, graph_matrix.outdegree(node_six)
			assert_equal -1, graph_matrix.outdegree(node_seven)
			assert_equal -1, graph_matrix.outdegree(node_eight)
		end

	end

	context 'B.4: adding the nodes again to the same graph is impossible' do

		should 'add_node returns false because the nodes have already been added to the graph' do
			assert_equal false, graph_matrix.add_node(node_one)
			assert_equal false, graph_matrix.add_node(node_two)
			assert_equal false, graph_matrix.add_node(node_three)
			assert_equal false, graph_matrix.add_node(node_four)
			assert_equal false, graph_matrix.add_node(node_five)
		end

	end




	#   █████╗ ██████╗  ██████╗███████╗
	#  ██╔══██╗██╔══██╗██╔════╝██╔════╝
	#  ███████║██████╔╝██║	   ███████╗
	#  ██╔══██║██╔══██╗██║	   ╚════██║
	#  ██║  ██║██║  ██║╚██████╗███████║
	#  ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝


	context 'C.1: adding arcs to the graph.' do

		setup do
			graph_matrix.add_arc(node_one, node_two)
			graph_matrix.add_arc(node_two, node_two)
			graph_matrix.add_arc(node_four, node_two)
			graph_matrix.add_arc(node_one, node_three)
			graph_matrix.add_arc(node_two, node_four)
			graph_matrix.add_arc(node_six, node_four)
			graph_matrix.add_arc(node_seven, node_one)
			graph_matrix.add_arc(node_two, node_eight)
			graph_matrix.add_arc(node_seven, node_eight)
		end

		should 'arc_exists method works properly' do
			assert_equal true, graph_matrix.arc_exists(node_one, node_two)
			assert_equal true, graph_matrix.arc_exists(node_two, node_two)
			assert_equal true, graph_matrix.arc_exists(node_four, node_two)
			assert_equal true, graph_matrix.arc_exists(node_one, node_three)
			assert_equal true, graph_matrix.arc_exists(node_two, node_four)
			assert_equal false, graph_matrix.arc_exists(node_five, node_one)
			assert_equal false, graph_matrix.arc_exists(node_six, node_three)
		end

		should 'is_empty returns false because we added some arcs' do
			assert_equal false, graph_matrix.is_empty
		end

		should 'nb_arcs doesn\'t 0 anymore' do
			refute_equal 0, graph_matrix.nb_arcs
		end

		should 'nb_arcs returns 5 because we added 5 arcs' do
			assert_equal 5, graph_matrix.nb_arcs
		end

	end

	context 'C.2: Testing remove_arc.' do

		setup do
			graph_matrix.remove_arc(node_one, node_two)
			graph_matrix.remove_arc(node_two, node_two)
			graph_matrix.remove_arc(node_four, node_two)
			graph_matrix.remove_arc(node_one, node_three)
			graph_matrix.remove_arc(node_two, node_four)
			graph_matrix.remove_arc(node_six, node_four)
			graph_matrix.remove_arc(node_seven, node_one)
			graph_matrix.remove_arc(node_two, node_eight)
			graph_matrix.remove_arc(node_seven, node_eight)
		end

		should 'arc_exists method works properly' do
			assert_equal false, graph_matrix.arc_exists(node_one, node_two)
			assert_equal false, graph_matrix.arc_exists(node_two, node_two)
			assert_equal false, graph_matrix.arc_exists(node_four, node_two)
			assert_equal false, graph_matrix.arc_exists(node_one, node_three)
			assert_equal false, graph_matrix.arc_exists(node_two, node_four)
			assert_equal false, graph_matrix.arc_exists(node_five, node_one)
			assert_equal false, graph_matrix.arc_exists(node_six, node_three)
		end

		should 'is_empty doesn\'t return false anymore because we removed the arcs' do
			refute_equal false, graph_matrix.is_empty
		end

		should 'is_empty returns true because we removed the arcs' do
			assert_equal true, graph_matrix.is_empty
		end

		should 'nb_arcs doesn\'t 5 anymore' do
			refute_equal 5, graph_matrix.nb_arcs
		end

		should 'nb_arcs returns 0' do
			assert_equal 0, graph_matrix.nb_arcs
		end
	end

	context 'C.3: Testing add_arc_private and arc_exists_private methods.' do

		setup do
			node_one_index = graph_matrix.indexing.index(node_one)
			node_two_index = graph_matrix.indexing.index(node_two)
			node_three_index = graph_matrix.indexing.index(node_three)
			node_four_index = graph_matrix.indexing.index(node_four)
			node_five_index = graph_matrix.indexing.index(node_five)
			node_six_index = graph_matrix.indexing.index(node_six)

			graph_matrix.add_arc_private(node_one_index, node_two_index)
			graph_matrix.add_arc_private(node_one_index, node_two_index)
			graph_matrix.add_arc_private(node_two_index, node_two_index)
			graph_matrix.add_arc_private(node_four_index, node_two_index)
			graph_matrix.add_arc_private(node_one_index, node_three_index)
			graph_matrix.add_arc_private(node_two_index, node_four_index)
		end

		should 'the arc_exists_private method works properly' do
			assert_equal true, graph_matrix.arc_exists_private(node_one_index, node_two_index)
			assert_equal true, graph_matrix.arc_exists_private(node_two_index, node_two_index)
			assert_equal true, graph_matrix.arc_exists_private(node_four_index, node_two_index)
			assert_equal true, graph_matrix.arc_exists_private(node_one_index, node_three_index)
			assert_equal true, graph_matrix.arc_exists_private(node_two_index, node_four_index)
			assert_equal false, graph_matrix.arc_exists_private(node_five_index, node_one_index)
			assert_equal false, graph_matrix.arc_exists_private(node_six_index, node_three_index)
		end

		should 'is_empty doesn\'t returns true anymore because we added some arcs' do
			refute_equal true, graph_matrix.is_empty
		end

		should 'is_empty returns false because we added some arcs' do
			assert_equal false, graph_matrix.is_empty
		end

		should 'nb_arcs doesn\'t 0 anymore' do
			refute_equal 0, graph_matrix.nb_arcs
		end

		should 'nb_arcs returns 5 because we added 5 arcs' do
			assert_equal 5, graph_matrix.nb_arcs
		end

	end

	context 'C.4: testing arc_value method.' do

		setup do
			graph_matrix.arc_value(node_one, node_two, 2)
			graph_matrix.arc_value(node_one, node_three, 5)
			graph_matrix.arc_value(node_two, node_two, 3)
			graph_matrix.arc_value(node_two, node_four, 6)
			graph_matrix.arc_value(node_four, node_two, 4)

			graph_matrix.arc_value(node_one, node_one, 99)
			graph_matrix.arc_value(node_one, node_four, 99)
			graph_matrix.arc_value(node_one, node_five, 99)
			graph_matrix.arc_value(node_one, node_six, 99)
			graph_matrix.arc_value(node_one, node_seven, 99)
			graph_matrix.arc_value(node_one, node_eight, 99)

			graph_matrix.arc_value(node_two, node_one, 99)
			graph_matrix.arc_value(node_two, node_three, 99)
			graph_matrix.arc_value(node_two, node_five, 99)
			graph_matrix.arc_value(node_two, node_six, 99)
			graph_matrix.arc_value(node_two, node_seven, 99)
			graph_matrix.arc_value(node_two, node_eight, 99)

			graph_matrix.arc_value(node_three, node_one, 99)
			graph_matrix.arc_value(node_three, node_two, 99)
			graph_matrix.arc_value(node_three, node_three, 99)
			graph_matrix.arc_value(node_three, node_four, 99)
			graph_matrix.arc_value(node_three, node_five, 99)
			graph_matrix.arc_value(node_three, node_six, 99)
			graph_matrix.arc_value(node_three, node_seven, 99)
			graph_matrix.arc_value(node_three, node_eight, 99)

			graph_matrix.arc_value(node_four, node_one, 99)
			graph_matrix.arc_value(node_four, node_three, 99)
			graph_matrix.arc_value(node_four, node_four, 99)
			graph_matrix.arc_value(node_four, node_five, 99)
			graph_matrix.arc_value(node_four, node_six, 99)
			graph_matrix.arc_value(node_four, node_seven, 99)
			graph_matrix.arc_value(node_four, node_eight, 99)

			graph_matrix.arc_value(node_five, node_one, 99)
			graph_matrix.arc_value(node_five, node_two, 99)
			graph_matrix.arc_value(node_five, node_three, 99)
			graph_matrix.arc_value(node_five, node_four, 99)
			graph_matrix.arc_value(node_five, node_five, 99)
			graph_matrix.arc_value(node_five, node_six, 99)
			graph_matrix.arc_value(node_five, node_seven, 99)
			graph_matrix.arc_value(node_five, node_eight, 99)

			graph_matrix.arc_value(node_six, node_one, 99)
			graph_matrix.arc_value(node_six, node_two, 99)
			graph_matrix.arc_value(node_six, node_three, 99)
			graph_matrix.arc_value(node_six, node_four, 99)
			graph_matrix.arc_value(node_six, node_five, 99)
			graph_matrix.arc_value(node_six, node_six, 99)
			graph_matrix.arc_value(node_six, node_seven, 99)
			graph_matrix.arc_value(node_six, node_eight, 99)

			graph_matrix.arc_value(node_seven, node_one, 99)
			graph_matrix.arc_value(node_seven, node_two, 99)
			graph_matrix.arc_value(node_seven, node_three, 99)
			graph_matrix.arc_value(node_seven, node_four, 99)
			graph_matrix.arc_value(node_seven, node_five, 99)
			graph_matrix.arc_value(node_seven, node_six, 99)
			graph_matrix.arc_value(node_seven, node_seven, 99)
			graph_matrix.arc_value(node_seven, node_eight, 99)

			graph_matrix.arc_value(node_eight, node_one, 99)
			graph_matrix.arc_value(node_eight, node_two, 99)
			graph_matrix.arc_value(node_eight, node_three, 99)
			graph_matrix.arc_value(node_eight, node_four, 99)
			graph_matrix.arc_value(node_eight, node_five, 99)
			graph_matrix.arc_value(node_eight, node_six, 99)
			graph_matrix.arc_value(node_eight, node_seven, 99)
			graph_matrix.arc_value(node_eight, node_eight, 99)

		end

		should 'getting arc_value works properly' do
			refute_equal 99, graph_matrix.arc_value(node_one, node_one)
			assert_equal -1, graph_matrix.arc_value(node_one, node_one)
			assert_equal 2, graph_matrix.arc_value(node_one, node_two)
			assert_equal 5, graph_matrix.arc_value(node_one, node_three)
			refute_equal 99, graph_matrix.arc_value(node_one, node_one)
			assert_equal -1, graph_matrix.arc_value(node_one, node_four)
			refute_equal 99, graph_matrix.arc_value(node_one, node_one)
			assert_equal -1, graph_matrix.arc_value(node_one, node_five)
			refute_equal 99, graph_matrix.arc_value(node_one, node_one)
			assert_equal -1, graph_matrix.arc_value(node_one, node_six)
			refute_equal 99, graph_matrix.arc_value(node_one, node_one)
			assert_equal -1, graph_matrix.arc_value(node_one, node_seven)
			refute_equal 99, graph_matrix.arc_value(node_one, node_one)
			assert_equal -1, graph_matrix.arc_value(node_one, node_eight)

			refute_equal -99, graph_matrix.arc_value(node_two, node_one)
			assert_equal -1, graph_matrix.arc_value(node_two, node_one)
			assert_equal 3, graph_matrix.arc_value(node_two, node_two)
			refute_equal 99, graph_matrix.arc_value(node_two, node_three)
			assert_equal -1, graph_matrix.arc_value(node_two, node_three)
			assert_equal 6, graph_matrix.arc_value(node_two, node_four)
			refute_equal 99, graph_matrix.arc_value(node_two, node_five)
			assert_equal -1, graph_matrix.arc_value(node_two, node_five)
			refute_equal 99, graph_matrix.arc_value(node_two, node_six)
			assert_equal -1, graph_matrix.arc_value(node_two, node_six)
			refute_equal 99, graph_matrix.arc_value(node_two, node_seven)
			assert_equal -1, graph_matrix.arc_value(node_two, node_seven)
			refute_equal 99, graph_matrix.arc_value(node_two, node_eight)
			assert_equal -1, graph_matrix.arc_value(node_two, node_eight)

			refute_equal 99, graph_matrix.arc_value(node_three, node_one)
			assert_equal -1, graph_matrix.arc_value(node_three, node_one)
			refute_equal 99, graph_matrix.arc_value(node_three, node_two)
			assert_equal -1, graph_matrix.arc_value(node_three, node_two)
			refute_equal 99, graph_matrix.arc_value(node_three, node_three)
			assert_equal -1, graph_matrix.arc_value(node_three, node_three)
			refute_equal 99, graph_matrix.arc_value(node_three, node_four)
			assert_equal -1, graph_matrix.arc_value(node_three, node_four)
			refute_equal 99, graph_matrix.arc_value(node_three, node_five)
			assert_equal -1, graph_matrix.arc_value(node_three, node_five)
			refute_equal 99, graph_matrix.arc_value(node_three, node_six)
			assert_equal -1, graph_matrix.arc_value(node_three, node_six)
			refute_equal 99, graph_matrix.arc_value(node_three, node_seven)
			assert_equal -1, graph_matrix.arc_value(node_three, node_seven)
			refute_equal 99, graph_matrix.arc_value(node_three, node_eight)
			assert_equal -1, graph_matrix.arc_value(node_three, node_eight)

			refute_equal 99, graph_matrix.arc_value(node_four, node_one)
			assert_equal -1, graph_matrix.arc_value(node_four, node_one)
			assert_equal 4, graph_matrix.arc_value(node_four, node_two)
			refute_equal 99, graph_matrix.arc_value(node_four, node_three)
			assert_equal -1, graph_matrix.arc_value(node_four, node_three)
			refute_equal 99, graph_matrix.arc_value(node_four, node_four)
			assert_equal -1, graph_matrix.arc_value(node_four, node_four)
			refute_equal 99, graph_matrix.arc_value(node_four, node_five)
			assert_equal -1, graph_matrix.arc_value(node_four, node_five)
			refute_equal 99, graph_matrix.arc_value(node_four, node_six)
			assert_equal -1, graph_matrix.arc_value(node_four, node_six)
			refute_equal 99, graph_matrix.arc_value(node_four, node_seven)
			assert_equal -1, graph_matrix.arc_value(node_four, node_seven)
			refute_equal 99, graph_matrix.arc_value(node_four, node_eight)
			assert_equal -1, graph_matrix.arc_value(node_four, node_eight)

			refute_equal 99, graph_matrix.arc_value(node_five, node_one)
			assert_equal -1, graph_matrix.arc_value(node_five, node_one)
			refute_equal 99, graph_matrix.arc_value(node_five, node_two)
			assert_equal -1, graph_matrix.arc_value(node_five, node_two)
			refute_equal 99, graph_matrix.arc_value(node_five, node_three)
			assert_equal -1, graph_matrix.arc_value(node_five, node_three)
			refute_equal 99, graph_matrix.arc_value(node_five, node_four)
			assert_equal -1, graph_matrix.arc_value(node_five, node_four)
			refute_equal 99, graph_matrix.arc_value(node_five, node_five)
			assert_equal -1, graph_matrix.arc_value(node_five, node_five)
			refute_equal 99, graph_matrix.arc_value(node_five, node_six)
			assert_equal -1, graph_matrix.arc_value(node_five, node_six)
			refute_equal 99, graph_matrix.arc_value(node_five, node_seven)
			assert_equal -1, graph_matrix.arc_value(node_five, node_seven)
			refute_equal 99, graph_matrix.arc_value(node_five, node_eight)
			assert_equal -1, graph_matrix.arc_value(node_five, node_eight)

			refute_equal 99, graph_matrix.arc_value(node_six, node_one)
			assert_equal -1, graph_matrix.arc_value(node_six, node_one)
			refute_equal 99, graph_matrix.arc_value(node_six, node_two)
			assert_equal -1, graph_matrix.arc_value(node_six, node_two)
			refute_equal 99, graph_matrix.arc_value(node_six, node_three)
			assert_equal -1, graph_matrix.arc_value(node_six, node_three)
			refute_equal 99, graph_matrix.arc_value(node_six, node_four)
			assert_equal -1, graph_matrix.arc_value(node_six, node_four)
			refute_equal 99, graph_matrix.arc_value(node_six, node_five)
			assert_equal -1, graph_matrix.arc_value(node_six, node_five)
			refute_equal 99, graph_matrix.arc_value(node_six, node_six)
			assert_equal -1, graph_matrix.arc_value(node_six, node_six)
			refute_equal 99, graph_matrix.arc_value(node_six, node_seven)
			assert_equal -1, graph_matrix.arc_value(node_six, node_seven)
			refute_equal 99, graph_matrix.arc_value(node_six, node_eight)
			assert_equal -1, graph_matrix.arc_value(node_six, node_eight)

			refute_equal 99, graph_matrix.arc_value(node_seven, node_one)
			assert_equal -1, graph_matrix.arc_value(node_seven, node_one)
			refute_equal 99, graph_matrix.arc_value(node_seven, node_two)
			assert_equal -1, graph_matrix.arc_value(node_seven, node_two)
			refute_equal 99, graph_matrix.arc_value(node_seven, node_three)
			assert_equal -1, graph_matrix.arc_value(node_seven, node_three)
			refute_equal 99, graph_matrix.arc_value(node_seven, node_four)
			assert_equal -1, graph_matrix.arc_value(node_seven, node_four)
			refute_equal 99, graph_matrix.arc_value(node_seven, node_five)
			assert_equal -1, graph_matrix.arc_value(node_seven, node_five)
			refute_equal 99, graph_matrix.arc_value(node_seven, node_six)
			assert_equal -1, graph_matrix.arc_value(node_seven, node_six)
			refute_equal 99, graph_matrix.arc_value(node_seven, node_seven)
			assert_equal -1, graph_matrix.arc_value(node_seven, node_seven)
			refute_equal 99, graph_matrix.arc_value(node_seven, node_eight)
			assert_equal -1, graph_matrix.arc_value(node_seven, node_eight)

			refute_equal 99, graph_matrix.arc_value(node_eight, node_one)
			assert_equal -1, graph_matrix.arc_value(node_eight, node_one)
			refute_equal 99, graph_matrix.arc_value(node_eight, node_two)
			assert_equal -1, graph_matrix.arc_value(node_eight, node_two)
			refute_equal 99, graph_matrix.arc_value(node_eight, node_three)
			assert_equal -1, graph_matrix.arc_value(node_eight, node_three)
			refute_equal 99, graph_matrix.arc_value(node_eight, node_four)
			assert_equal -1, graph_matrix.arc_value(node_eight, node_four)
			refute_equal 99, graph_matrix.arc_value(node_eight, node_five)
			assert_equal -1, graph_matrix.arc_value(node_eight, node_five)
			refute_equal 99, graph_matrix.arc_value(node_eight, node_six)
			assert_equal -1, graph_matrix.arc_value(node_eight, node_six)
			refute_equal 99, graph_matrix.arc_value(node_eight, node_seven)
			assert_equal -1, graph_matrix.arc_value(node_eight, node_seven)
			refute_equal 99, graph_matrix.arc_value(node_eight, node_eight)
			assert_equal -1, graph_matrix.arc_value(node_eight, node_eight)
		end

	end

	context 'C.5: testing indegree and outdegree methods.' do

		should 'indegree works properly.' do
			assert_equal 0, graph_matrix.indegree(node_one)
			assert_equal 3, graph_matrix.indegree(node_two)
			assert_equal 1, graph_matrix.indegree(node_three)
			assert_equal 1, graph_matrix.indegree(node_four)
			assert_equal 0, graph_matrix.indegree(node_five)
			assert_equal -1, graph_matrix.indegree(node_six)
			assert_equal -1, graph_matrix.indegree(node_seven)
			assert_equal -1, graph_matrix.indegree(node_eight)
		end

		should 'outdegree works properly.' do
			assert_equal 2, graph_matrix.outdegree(node_one)
			assert_equal 2, graph_matrix.outdegree(node_two)
			assert_equal 0, graph_matrix.outdegree(node_three)
			assert_equal 1, graph_matrix.outdegree(node_four)
			assert_equal 0, graph_matrix.outdegree(node_five)
			assert_equal -1, graph_matrix.outdegree(node_six)
			assert_equal -1, graph_matrix.outdegree(node_seven)
			assert_equal -1, graph_matrix.outdegree(node_eight)
		end

	end

	context 'C.6: testing predecessors, successors and neighbors methods.' do

		setup do
			node_two_predecessors[node_one.name] = node_one
			node_two_predecessors[node_two.name] = node_two
			node_two_predecessors[node_four.name] = node_four
			node_three_predecessors[node_one.name] = node_one
			node_four_predecessors[node_two.name] = node_two

			node_one_successors[node_two.name] = node_two
			node_one_successors[node_three.name] = node_three
			node_two_successors[node_two.name] = node_two
			node_two_successors[node_four.name] = node_four
			node_two_successors[node_four.name] = node_four
			node_four_successors[node_two.name] = node_two

			node_one_neighbors[node_two.name] = node_two
			node_one_neighbors[node_three.name] = node_three
			node_two_neighbors[node_one.name] = node_one
			node_two_neighbors[node_two.name] = node_two
			node_two_neighbors[node_four.name] = node_four
			node_three_neighbors[node_one.name] = node_one
			node_four_neighbors[node_two.name] = node_two
		end

		should 'predecessors works properly.' do
			assert_equal 0, graph_matrix.predecessors(node_one).length
			assert_equal node_one_predecessors, graph_matrix.predecessors(node_one)

			assert_equal 3, graph_matrix.predecessors(node_two).length
			assert_equal node_two_predecessors, graph_matrix.predecessors(node_two)

			assert_equal 1, graph_matrix.predecessors(node_three).length
			assert_equal node_three_predecessors, graph_matrix.predecessors(node_three)

			assert_equal 1, graph_matrix.predecessors(node_four).length
			assert_equal node_four_predecessors, graph_matrix.predecessors(node_four)

			assert_equal 0, graph_matrix.predecessors(node_five).length
			assert_equal node_five_predecessors, graph_matrix.predecessors(node_five)

			assert_equal 0, graph_matrix.predecessors(node_six).length
			assert_equal node_six_predecessors, graph_matrix.predecessors(node_six)

			assert_equal 0, graph_matrix.predecessors(node_seven).length
			assert_equal node_seven_predecessors, graph_matrix.predecessors(node_seven)

			assert_equal 0, graph_matrix.predecessors(node_eight).length
			assert_equal node_eight_predecessors, graph_matrix.predecessors(node_eight)
		end

		should 'successors works properly.' do
			assert_equal 2, graph_matrix.successors(node_one).length
			assert_equal node_one_successors, graph_matrix.successors(node_one)

			assert_equal 2, graph_matrix.successors(node_two).length
			assert_equal node_two_successors, graph_matrix.successors(node_two)

			assert_equal 0, graph_matrix.successors(node_three).length
			assert_equal node_three_successors, graph_matrix.successors(node_three)

			assert_equal 1, graph_matrix.successors(node_four).length
			assert_equal node_four_successors, graph_matrix.successors(node_four)

			assert_equal 0, graph_matrix.successors(node_five).length
			assert_equal node_five_successors, graph_matrix.successors(node_five)

			assert_equal 0, graph_matrix.successors(node_six).length
			assert_equal node_six_successors, graph_matrix.successors(node_six)

			assert_equal 0, graph_matrix.successors(node_seven).length
			assert_equal node_seven_successors, graph_matrix.successors(node_seven)

			assert_equal 0, graph_matrix.successors(node_eight).length
			assert_equal node_eight_successors, graph_matrix.successors(node_eight)
		end

		should 'neighbors works properly.' do
			assert_equal 2, graph_matrix.neighbors(node_one).length
			assert_equal node_one_neighbors, graph_matrix.neighbors(node_one)
			assert_equal 3, graph_matrix.neighbors(node_two).length
			assert_equal node_two_neighbors, graph_matrix.neighbors(node_two)
			assert_equal 1, graph_matrix.neighbors(node_three).length
			assert_equal node_three_neighbors, graph_matrix.neighbors(node_three)
			assert_equal 1, graph_matrix.neighbors(node_four).length
			assert_equal node_four_neighbors, graph_matrix.neighbors(node_four)
			assert_equal 0, graph_matrix.neighbors(node_five).length
			assert_equal node_five_neighbors, graph_matrix.neighbors(node_five)
			assert_equal 0, graph_matrix.neighbors(node_six).length
			assert_equal node_six_neighbors, graph_matrix.neighbors(node_six)
			assert_equal 0, graph_matrix.neighbors(node_seven).length
			assert_equal node_seven_neighbors, graph_matrix.neighbors(node_seven)
			assert_equal 0, graph_matrix.neighbors(node_eight).length
			assert_equal node_eight_neighbors, graph_matrix.neighbors(node_eight)
		end

	end

end
