#lib/undirected_graph.rb

class UndirectedGraph

	def initialize()
	end

	#accessor methods:

	def vertices
	end

	def neighbors(vertex)
	end

	#if there is no edge throws and ArgumentError
	def weight(vertex1, vertex2)
	end

	def degree(vertex)
	end

	def has_vertex?(vertex)
	end

	def has_edge?(vertex1, vertex2)
	end

	def size
	end

	#mutator methods:

	#adds a vertex to the graph
	#if a vertex is already in the graph, does nothing
	#returns true iff a vertex was added (false if the vertex was already in the graph)
	def add_vertex!(vertex)
	end

	#adds an edge with the given weight between two vertices, starting at vertex1 and pointing to the vertex2
	#if there is already an edge with said weight, it updates the weight
	#if either one (or both) of the vertices are not in the graph, it throws an ArgumentError
	#also, if you're trying to make a self_loop, throws an error
	def add_edge!(vertex1, vertex2, weight)
	end

	#removes a vertex and and edges associated with it
	#if there is no such vertex in the graph, throws an ArgumentError
	#returns a hash of the removed vertex's out_neighborhood
	def remove_vertex!(vertex)
	end

	#removes an edge between two vertices (vertex1 <-> vertex2)
	#returns the weight of the removed edge
	#if there was no such edge (or either one of the vertices were not in the vertex, throws an ArgumentError)
	def remove_edge!(vertex1, vertex2)
	end
end