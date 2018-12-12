include RSpec
require_relative 'address_calc_sort'

describe "#address_calc_sort" do
  it "moves the largest integer to the end of the array" do
    expect( address_calc_sort([6,2,5,3,4]) ).to end_with 6
  end

  it "moves the smallest integer to the front of the array" do
    expect( address_calc_sort([6,2,5,3,4]) ).to start_with 2
  end

  it "handles an empty array" do
    expect( address_calc_sort([]) ).to eq []
  end

  it "handles an array of length one" do
    expect( address_calc_sort([1]) ).to eq [1]
  end

  let (:sorted_array) { [1,2,3,4,5,6] }
  let (:shuffled_array) { sorted_array.shuffle }

  it "sorts the array from least to greatest" do
    expect( address_calc_sort([6,2,5,3,4]) ).to eq [2,3,4,5,6]
    expect( address_calc_sort(shuffled_array) ).to eq sorted_array
  end

  it "handles zero appropriately" do
    expect( address_calc_sort([6,2,5,3,4,0]) ).to start_with 0
  end

  it "handles negative numbers appropriately" do
    expect( address_calc_sort([6,2,-11, 5,3,4]) ).to start_with -11
  end
end 
