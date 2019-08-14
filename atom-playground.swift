// protocol SomeProtocol {
//   var settableProperty:String { get set }
//   var notNeedToBeSettableProperty:Sring { get } //read mode
//
// }
//
// protocol AnothorProtocol {
//   static var someTypeProperty:Int { get set }
//   static var anotherTypeProperty: Int { get } // read mode
// }

protocol Receiveable {
    func received(data: Any, from: Sendable)
}

protocol Sendable {
    var from: Sendable {get}
    var to: Receiveable? {get}

    func send(data: Any)

    static func isSendableInstance(_ instance: Any) -> Bool
}

class Message: Sendable, Receiveable {
  //var sendar: String
    var from: Sendable {
        return self
    }

    var to: Receiveable?

    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Message has no receiver")
            return
        }
        receiver.received(data: data, from: self.from)
    }

    func received(data: Any, from: Sendable) {
        print("Message received \(data) from \(from)")
    }

      class func isSendableInstance(_ instance: Any) -> Bool {
          if let isSendableInstance: Sendable = instance as? Sendable {
              return isSendableInstance.to != nil
          }
          return false
        }

      // init(sender: String, receiver: String ) {
      //   self.sender = sender
      //   self.to = receiver
      // }
    }

    class Mail: Sendable, Receiveable {
        var from: Sendable {
            return self
        }

        var to: Receiveable?

        func send(data: Any) {
            guard let receiver: Receiveable = self.to else {
                print("Mail has no receiver")
                return
            }
            receiver.received(data: data, from: self.from)
        }

        func received(data: Any, from: Sendable) {
            print("Mail received \(data) from \(from)")
        }

        static func isSendableInstance(_ instance: Any) -> Bool {
            if let isSendableInstance: Sendable = instance as? Sendable {
                return isSendableInstance.to != nil
            }
            return false
        }
      // init(sender: String, receiver: String) {
      //   self.from = sender
      //   self.to = receiver
      // }
}


let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

myPhoneMessage.send(data:"Hello")

myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "hello")

let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "hi")

myMail.to = yourMail
myMail.send(data:"Hi")

myMail.to = myPhoneMessage
myMail.send(data:"bye")


Message.isSendableInstance("hello")

Message.isSendableInstance(myPhoneMessage)

Message.isSendableInstance(yourPhoneMessage)
Mail.isSendableInstance(myPhoneMessage)
Mail.isSendableInstance(myMail)
