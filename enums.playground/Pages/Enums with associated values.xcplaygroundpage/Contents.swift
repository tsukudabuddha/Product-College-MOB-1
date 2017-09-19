//: [Previous](@previous)
class Person {
  let name: String
  
  init(name: String) {
    self.name = name
  }
}

enum MassageChair {
  case free
  case occupied(Person)
}

let nikolas = Person(name: "Nikolas")
let massageChair = MassageChair.occupied(nikolas)

switch massageChair {
case .free:
  print("The chair is currently free.")
case .occupied(let person):
  print("\(person.name) is enjoying an extremyle nice and comforting massage right now. Please don't disturb and wait until it's your turn!")
}

/*:
 
 ### Challenges
 
 1. Model a type called `Box` that is either empty or contains exactly one `Thing`. `Thing` looks as follows:
 ```
 class Thing {
   let name: String
 
   init(name: String) {
     self.name = name
   }
 }
 ```
 2. Create an empty `Box`
 3. Create three different `Box`es, each should contain one item of the following: `Soccer Ball`, `Phone`, `Chocolate`
 4. Write a function that takes a `Box` as an argument and returns a `String` indicating what that `Box` contains.
 5. Make the `Box` _generic_ so that it can contain an object of any type, not just `Thing`.
 */

// 1
class Thing {
  let name: String
  
  init(name: String) {
    self.name = name
  }
}

// 2 and 5
enum Box<obj: Any> {
  case empty
  case contains(obj)
}

var emptyBox = Box<Any>.empty

// 3
var soccerBall = Thing(name: "Soccer Ball")
var phone = Thing(name: "Phone")
var chocolate = Thing(name: "Chocolate")

// 4
func returnContents(box: Box<Any>) -> String {
    var contents: String = ""
    switch box {
    case .empty:
       contents = "nothing"
    case .contains(let thing):
        if type(of: thing) == Thing.self {
            contents = (thing.self as! Thing).name
        } else {
            contents = String(describing: thing)
        }
    }
    return contents
}
var boxWithSoccerBall = Box<Any>.contains(soccerBall)
var boxWithPhone = Box<Any>.contains(phone)
var boxWithChocolate = Box<Any>.contains(chocolate)
var boxWithMe = Box<Any>.contains(1)

var contents = returnContents(box: boxWithMe)
print("The box contains: \(contents)")








