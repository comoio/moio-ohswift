func swapTwoValus<T>(_ a: inout T, _ b: inout T) {
    let temporaryA: T = a
    a = b
    b = temporaryA
}


swapTwoValus(&numberOne, &numberTwo)
print("\(numberOne), \(numberTwo)")

swapTwoValus(&stringOne, &stringTwo)
print("\(stringOne), \(stringTwo)")

swapTwoValus(&anyOne, &anyTwo)
print("\(anyOne), \(anyTwo)")

swapTwoValus(&numberOne, &stringTwo)
