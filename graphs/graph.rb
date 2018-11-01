require_relative 'vertex'
require_relative 'edge'
require_relative 'edge_set'
require 'matrix'

# Graph implementation in Ruby
class Graph
  attr_reader :vertices, :edges
  def initialize(vertices, edges = EdgeSet.new)
  end

  def vertex?(v)
  end

  def edge?(e)
  end

  def adjacent?(v1, v2)
  end

  def degree
    # Handshaking lemma (https://en.wikipedia.org/wiki/Handshaking_lemma)
  end

  # min degree
  def min_degree
  end

  # max degree
  def max_degree
  end
end