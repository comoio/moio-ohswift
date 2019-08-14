for i in 0...2 {
    defer {
        print("A", terminator: " ")
    }

    print(i, terminator: " ")

    if i % 2 == 0 {
        defer {
            print("", terminator: "\n")

        }

        print("It's even", terminator: " ")

    }
}
