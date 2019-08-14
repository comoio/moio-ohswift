// error enum style

enum ErrorHelper: Error {
    case noName
    case inCollect(age: Int)
    case unknown
}


// 이름과 나이를 받아서 유효성이 있는지 테스트

func errorMessage(yourName: String?, yourAge age: Int = 0) throws -> String {

    guard let name: String = yourName else {
        throw ErrorHelper.noName
    }

    if age > 150 {
        throw ErrorHelper.inCollect(age: age)
    }

    return "Error helper! My name is \(name)" + (age > 0 ? "I am \(age) years old.": "")

}