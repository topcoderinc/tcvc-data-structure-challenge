include RSpec

require_relative 'node'
require_relative 'linked_list'

RSpec.describe LinkedList, type: Class do
  let(:n1) { Node.new("Rob") }
  let(:n2) { Node.new("Ben") }
  let(:n3) { Node.new("Mike") }
  let(:n4) { Node.new("Ken") }
  let(:list) { LinkedList.new }

  describe "#add_to_tail" do
    it "adds a Node to the tail" do
      list.add_to_tail(n1)
      expect(list.tail).to eq n1
      list.add_to_tail(n2)
      expect(list.tail).to eq n2
    end
  end

  describe "#remove_tail" do
    it "removes nodes from the tail" do
      list.add_to_tail(n1)
      list.add_to_tail(n2)
      expect(list.tail).to eq n2
      list.remove_tail
      expect(list.tail).to eq n1
      list.remove_tail
      expect(list.tail).to eq nil
    end
  end

  describe "#print" do
    before do
      list.add_to_tail(n1)
      list.add_to_tail(n2)
    end

    specify { expect { list.print }.to output("Rob\nBen\n").to_stdout }
  end

  describe "#delete" do
    before do
      list.add_to_tail(n1)
      list.add_to_tail(n2)
      list.add_to_tail(n3)
    end

    it "removes the head of a list properly" do
      list.delete(n1)
      expect(list.head).to eq n2
      expect(list.head.next).to eq n3
      expect(list.tail).to eq n3
    end

    it "removes the middle element of a list properly" do
      list.delete(n2)
      expect(list.head).to eq n1
      expect(list.head.next).to eq n3
      expect(list.tail).to eq n3
    end

    it "removes the middle element but it's not there" do
      expect(list.delete(n4)).to eq nil
    end

    it "removes the last element of a list properly" do
      list.delete(n3)
      expect(list.head).to eq n1
      expect(list.head.next).to eq n2
      expect(list.tail).to eq n2
    end
  end

  describe "#add_to_front" do
    it "adds the node to the front of the linked list" do
      list.add_to_front(n1)
      expect(list.head).to eq n1
      list.add_to_front(n2)
      expect(list.head).to eq n2
    end
  end

  describe "#remove_front" do
    it "removes the node to the front of the linked list" do
      list.add_to_front(n1)
      expect(list.head).to eq n1
      list.add_to_front(n2)
      expect(list.head).to eq n2
      list.remove_front
      expect(list.head).to eq n1
      list.remove_front
      expect(list.head).to eq nil
    end
  end

  describe "#find" do
    it "it finds items at nth index" do
        list.add_to_front(n1)
        list.add_to_front(n2)
        list.add_to_front(n3)
        expect(list.find(1)).to eq n2
    end
  end

  describe "#remove_at" do
    it "it removes items at nth index" do
        list.add_to_front(n1)
        list.add_to_front(n2)
        list.add_to_front(n3)
        list.remove_at(1)
        expect(list.find(1)).to eq n1
    end
  end
end