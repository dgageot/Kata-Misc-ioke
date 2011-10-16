use("postfix")
use("ispec")

describe("postfix",
it("should recognize number",
	postfix("1") should == ["1"]
)
it("should recognize two terms multiplication",
	postfix("1*1") should == ["1", "1", "*"]
)
it("should recognize three terms multiplication",
	postfix("1*1*1") should == ["1", "1", "*", "1", "*"]
)
)
