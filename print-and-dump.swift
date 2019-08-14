struct BasicInformation {

    let name: String
    var age: Int

}


var yagomInfo: BasicInformation = BasicInformation(name: "Yagom", age: 99)

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0

}

let yagom: Person = Person()
yagom.height = 179.9
yagom.weight = 66.7

print(yagom)

dump(yagom)
