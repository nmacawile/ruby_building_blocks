require "enumerable_methods"

describe Enumerable do
	let(:collection) do
		[12, 23, 34, 45]
	end 

	describe "#my_each" do
		it "invokes block on every element in collection" do
			expect { |b| collection.my_each(&b) }.to yield_successive_args(12, 23, 34, 45)
		end
	end

	describe "#my_each_with_index" do
		it "invokes block on every element and index in collection" do
			expect { |b| collection.my_each_with_index(&b) }.to yield_successive_args([12, 0], [23, 1], [34, 2], [45, 3])
		end
	end

	describe "#my_select" do
		it "returns all elements which satisfy condition in block" do
			expect(collection.my_select { |e| e.even? }).to match_array([12, 34])
		end
	end

	describe "#my_all?" do
		it "returns 'true' if all elements satisfy condition in block" do
			expect(collection.all? { |e| e > 0 }).to be true
		end

		it "returns 'false' if not all elements satisfy condition in block" do
			expect(collection.all? { |e| e < 45 }).to be false
		end

		it "returns 'true' if no block is given" do
			expect(collection.all?).to be true
		end
	end

	describe "#my_any?" do
		it "returns 'true' if at least one element satisfies condition in block" do
			expect(collection.any? { |e| e == 34 }).to be true
		end

		it "returns 'false' if no elements satisfy condition in block" do
			expect(collection.any? { |e| e > 45 }).to be false
		end

		it "returns 'true' if no block is given" do
			expect(collection.any?).to be true
		end
	end

	describe "#my_none?" do
		it "returns 'false' if at least one element satisfies condition in block" do
			expect(collection.none? { |e| e == 23 }).to be false
		end

		it "returns 'true' if no elements satisfy condition in block" do
			expect(collection.none? { |e| e > 45 }).to be true
		end

		it "returns 'false' if no block is given" do
			expect(collection.none?).to be false
		end
	end

	describe "#my_count" do
		it "returns number of elements which satisfy condition in block" do
			expect(collection.count { |e| e.odd? }).to eq(2)
		end

		it "returns size of collection if no block is given" do
			expect(collection.count).to eq(4)
		end
	end

	describe "#my_map" do
		context "when proc is passed as parameter" do
			it "calls proc on every element in collection" do
				proc = double
				[12, 23, 34, 45].each do |e|
					expect(proc).to receive(:call).with(e)
				end
				collection.my_map(proc)
			end

			it "calls proc and ignores block if present" do
				proc = double
				[12, 23, 34, 45].each do |e|
					expect(proc).to receive(:call).with(e)
				end
				expect { |b| collection.my_map(proc, &b) }.not_to yield_with_args
			end

			it "returns modified array" do
				expect(collection.my_map(Proc.new { |e| e + 1 })).to eq([13, 24, 35, 46])
			end
		end

		context "when no proc is passed as parameter and block is present" do
			it "invokes block on every element in collection" do
				expect { |b| collection.my_map(&b) }.to yield_successive_args(12, 23, 34, 45)
			end

			it "returns modified array" do
				expect(collection.my_map { |e| e + 1 }).to eq([13, 24, 35, 46])
			end
		end
	end

	describe "#my_inject" do
		it "invokes block on every element and returns accumulated value" do
			expect(collection.my_inject(1000) { |sum, e| sum + e  }).to eq(1114)
		end

		it "sets first element as initial value if not specified" do
			expect(collection.my_inject { |prod, e| prod * e  }).to eq(422_280)
		end
	end
end

describe "multiply_els(array)" do
	it "returns product of all elements in array" do
		expect(multiply_els([1, 2, 3, 4, 5])).to eq(120)
	end
end