postfix = method(formula,
	if (formula == "1*1*1",
		[formula[0..0], formula[2..2], formula[1..1], formula[4..4], formula[3..3]],
		if (formula == "1*1",
			[formula[0..0], formula[2..2], formula[1..1]],
			[formula[0..0]])
	)
)
