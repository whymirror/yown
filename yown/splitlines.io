//
// Stolen from the Io Socket addon
// used by the web server objects
//
Sequence hasSlot("splitLines") ifFalse(
	Sequence splitLines := method(
		lineStart := 0
		resultList := List clone

		nextCrIndex := nil
		nextLfIndex := nil

		while(lineStart < size,
			nextCrIndex = findSeq("\r", lineStart)
			nextLfIndex = findSeq("\n", lineStart)

			if(nextCrIndex and nextLfIndex,
				if(nextCrIndex < nextLfIndex,
					nextLfIndex = nil,
					nextCrIndex = nil
				)
			)

			if(nextCrIndex,
				resultList append(slice(lineStart, nextCrIndex))
				if(at(nextCrIndex + 1) == 10,
					lineStart = nextCrIndex + 2
				,
					lineStart = nextCrIndex + 1
				)
			,
				if(nextLfIndex,
					resultList append(slice(lineStart, nextLfIndex))
					lineStart = nextLfIndex + 1
				,
					break
				)
			)
		)

		resultList append(slice(lineStart, size))

		return resultList
	)
)
