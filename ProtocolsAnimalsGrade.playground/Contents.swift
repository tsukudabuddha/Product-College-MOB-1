
import UIKit
import PlaygroundSupport


// Problem #1
// Modeling Data (Structs, Enums, Classes)
// We want to represent Students and Courses
// Students have a list of courses that they take
// Courses also have a list of students
// Write a function in courses that prints out the names of all the students in a course
// Write an instance of student with a list of courses and an instance of course that has a list of students
// Test out the function in course that prints out its list of students

struct Student {
    var classes = [Course]()
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Course {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    var students = [Student]()
    
    func getRoster() {
        for student in self.students {
            print(student.name)
        }
    }
}

var onePerson = Student(name: "Andrew")
var otherPerson = Student(name: "Casey")
var math101 = Course(name: "Math101")

math101.students.append(onePerson)
math101.students.append(otherPerson)
onePerson.classes.append(math101)


print(math101.getRoster())

// Problem #2
// Protocols & Modeling (Structs, Enums, Classes)
/*:
 We need to model different types of Animals in the animal kindom
 a. Animals need to have a species
 b. All Animals need to eat food
 c. Some Animals can Jump, some can Fly
 d. Create instance of 3 animals with different species, some can fly, can jump, some can fly and jump
 e. Put them in an array and print out animals than can only fly
 
 
*/

class Animal {
    var species: String
    var name: String
    
    init(name: String, species: String) {
        self.name = name
        self.species = species
    }
    func eat(food: String) {
        print("\(self.name) eats \(food)")
    }
    
}

protocol canFly {
    var name: String {get set}
    func fly()
}

protocol canJump {
    func jump()
}

class Frog: Animal, canJump {
    
    override init(name: String, species: String) {
        super.init(name: name, species: species)
    }
    
    func jump() {
        print("Jump")
    }

}

class Bird: Animal, canFly {
    
    override init(name: String, species: String) {
        super.init(name: name, species: species)
    }
    
    func fly() {
        print("Fly")
    }
    
}

var pepe = Frog(name: "pepe", species: "Meme")
var birdie = Bird(name: "birdName", species: "Robin")
var otherBirdie = Bird(name: "birdName2", species: "Robin")
var dog = Animal(name: "fido", species: "Golden doodle")

var animalArray = [pepe, birdie, dog, otherBirdie]

print("\nThese animals can fly:")

for animal in animalArray {
    if let testAnimal = animal as? canFly {
        print(testAnimal.name)
    }
}

// Delegates Review
/*:
 
*/


//protocol MeansOfCommunicatingBetweenSenderAndReciever {
//    func senderSent(something: String)
//}
//
//struct Sender {
//    var delegate: MeansOfCommunicatingBetweenSenderAndReciever?
//
//    func somethingHappened() {
//        //Some action I want to send
//        delegate?.senderSent(something: "Hey")
//    }
//}
//
//struct Reciever: MeansOfCommunicatingBetweenSenderAndReciever {
//
//    func senderSent(something: String) {
//        print(something)
//    }
//}

//var sender = Sender()
//let reciever = Reciever()
//
//sender.delegate = reciever
//
//sender.somethingHappened()


// Problem #3
/*
 You have a UIView called touchable view that handles a tap.
 a. Write a delegate that delegates the touch action to another view/viewcontroller (SomeViewController)
 
 b. Draw a diagram for the delegation between the TouchableView and the ViewController
*/

protocol touchDelegate: class {
    func touchAction()
}
class TouchableView: UIView {
    
    let touchGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(tap:)))
    
    weak var delegate: touchDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addGestureRecognizer(touchGesture)
        
    }
    
    @objc func handleTap(tap: UITapGestureRecognizer) {
        delegate?.touchAction()
    }
}

let touchView = TouchableView(
    frame: CGRect(x: 0, y: 0, width: 100, height: 100)
)

touchView.backgroundColor = UIColor.red

// ViewController that will recieve taps
class SomeViewController: UIViewController, touchDelegate {
    
    let touchableView = touchView
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    func touchAction() {
        print("Tapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



let vc = SomeViewController()



// Implement Delegation from problem #3


// Extra material to make playground work
PlaygroundPage.current.liveView = touchView
