#lib/directed_graph.rb

class DirectedGraph

	def initialize()
		@vertices = {}
	end
	#accessor methods:

	#returns array of all of ther vertex values
	def vertices
	end

	#returns an array of all of the out neighbors of a vertex
	def out_neighbors(vertex)
	end

	#returns an array of all of a vertex's in_neighbors
	def in_neighbors(vertex)
	end

	#just returns the out_neighbors
	def neighbors(vertex)
	end

	#returns the weight of the edge between two vertices (vertex1 -> vertex2)
	#if there is no edge throws and ArgumentError
	def weight(vertex1, vertex2)
	end

	#returns the out-degree of a vertex
	def out_degree(vertex)
	end

	#returns the in-degree of a vertex
	def in_degree(vertex)
	end

	#returns the out_degree of a vertex
	def degree(vertex)
	end

	#returns true iff this.vertices.contains?(vertex)
	def has_vertex?(vertex)
	end

	#returns true iff vertex1.neighbors.contains?(vertex2) || vertex2.neighbors.contains?(vertex1)
	def has_edge?(vertex1, vertex2)
	end

	#returns the number of vertices in the graph
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

	#removes an edge between two vertices (vertex1 -> vertex2)
	#returns the weight of the removed edge
	#if there was no such edge (or either one of the vertices were not in the vertex, throws an ArgumentError)
	def remove_edge!(vertex1, vertex2)
	end
end