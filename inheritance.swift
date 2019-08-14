class Person {
    var name: String = ""
    var age: Int = 0
    var koreanAge: Int {
        return self.age + 1
    }

    var introduction: String {
        return "이름 : \(name). 나이 : \(age)"
    }
}


class Student: Person {
    var grade: String = "F"

    override var introduction: String {
        return super.introduction + "" + "학점 : \(self.grade)"
    }

    override var koreanAge: Int {
        get {
            return super.koreanAge
        }

        set {
            self.age = newValue - 1
        }
    }
}


let hongs: Person = Person()

hongs.name = "Hong Soon Moon"
hongs.age = 45
//hongs.koreanAge
print(hongs.introduction)
print(hongs.koreanAge)

let jay: Student = Student()
jay.name = "jay"
jay.age = 14
//jay.koreanAge = 15

print(jay.introduction)
print(jay.koreanAge)
