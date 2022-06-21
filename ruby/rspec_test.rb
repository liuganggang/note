
# 运行测试命令
bundle exec rspec

bundle exec rspec spec/models


bundle exec rspec spec/controllers/accounts_controller_spec.rb:8



# basic usage
RSpec.describe Order do
  context "with no items" do
    it "behaves one way" do
      # ...
    end
  end

  context "with one item" do
    it "behaves another way" do
      # ...
    end
  end
end


# shared_context and include_context


# write spec first, then run `rspec`, then coding. 
RSpec.describe Calculator do
  describe '#add' do
    it 'returns the sum of its arguments' do
      expect(Calculator.new.add(1, 2)).to eq(3)
    end
  end
end


expect(actual).to eq(expected)  # passes if actual == expected
expect(actual).to eql(expected) # passes if actual.eql?(expected)
expect(actual).not_to eql(not_expected) # passes if not(actual.eql?(expected))


expect(actual).to be >  expected
expect(actual).to be >= expected
expect(actual).to be <= expected
expect(actual).to be <  expected
expect(actual).to be_within(delta).of(expected)


expect(actual).to match(/expression/)

expect([1, 2, 3]).to eq([1, 2, 3])            # Order dependent equality check
expect([1, 2, 3]).to include(1)               # Exact ordering, partial collection matches
expect([1, 2, 3]).to include(2, 3)            #
expect([1, 2, 3]).to start_with(1)            # As above, but from the start of the collection
expect([1, 2, 3]).to start_with(1, 2)         #
expect([1, 2, 3]).to end_with(3)              # As above but from the end of the collection
expect([1, 2, 3]).to end_with(2, 3)           #
expect({:a => 'b'}).to include(:a => 'b')     # Matching within hashes
expect("this string").to include("is str")    # Matching within strings
expect("this string").to start_with("this")   #
expect("this string").to end_with("ring")     #
expect([1, 2, 3]).to contain_exactly(2, 3, 1) # Order independent matches
expect([1, 2, 3]).to match_array([3, 2, 1])   #

# Order dependent compound matchers
expect(
  [{:a => 'hash'},{:a => 'another'}]
).to match([a_hash_including(:a => 'hash'), a_hash_including(:a => 'another')])



expect(alphabet).to start_with("a").and end_with("z")
expect(stoplight.color).to eq("red").or eq("green").or eq("yellow")




































