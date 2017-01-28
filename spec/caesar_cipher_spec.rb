require "caesar_cipher"

describe "Caesar cipher" do
	it "replaces each character with their ciphered equivalent (right-shifted 3 times)" do
		expect(caesar_cipher("abcd")).to eql("defg")
	end

	it "maintains the case of the replaced character" do
		expect(caesar_cipher("aBcD")).to eql("dEfG")
	end

	it "goes back to 'A'/'a' when the ciphered character passes 'Z'/'z' respectively" do
		expect(caesar_cipher("zywx")).to eql("cbza")
	end

	it "does not affect non-alphabetic characters" do
		expect(caesar_cipher("abcde!@#123")).to eql("defgh!@#123")
	end

	it "accepts optional shift parameter" do
		expect(caesar_cipher("zywx", 5)).to eql("edbc")
	end

	it "accepts negative shift parameter (shifts to the left instead)" do
		expect(caesar_cipher("fghij", -5)).to eql("abcde")
	end

	it "accepts shift value greater than 26" do
		expect(caesar_cipher("caesar", 28)).to eql("ecguct")
	end

	it "accepts negative shift parameter less than -26" do
		expect(caesar_cipher("cdefg", -28)).to eql("abcde")
	end
end