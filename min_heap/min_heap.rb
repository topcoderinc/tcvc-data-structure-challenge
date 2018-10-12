require_relative 'node'
require 'thread'
require 'pry'
require 'byebug'

class MinHeap

  attr_reader :root
  attr_reader :count
  attr_reader :row_number

  def initialize(root)
    @root = root
    @count = 1
  end

  def insert(root, node)
  end

  def delete(root, data)
  end

  def find(root, data)
  end

  def printf(node)
  end
end