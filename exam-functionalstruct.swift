func sum(first:Int) -> ((Int) -> Int) {
	return { second in first + second }
}

sum(first: 10)(5)

