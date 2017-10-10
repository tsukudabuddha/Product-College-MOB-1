/*:
 
 ### Closures
 
 In this playground, you will work on a few examples that are using closures and the concept of passing functions as arguments into other functions.
 
 Here is some code that you will use in one of the challenges.
 
 */

// computes the sum of all digits in integer a; relevant for task 5
func sumOfDigits(a: Int) -> Int {
  return String(a).characters.flatMap{Int(String($0))}.reduce(0, +)
}
sumOfDigits(a: 123) // 6

/*:

 ### Challenges:
 
 1. Write a function called `doesApply` that returns a `Bool` and takes as arguments two `Int`s as well as a _function_ which again also takes two `Int`s and returns a `Bool`.
 2. Write a function called `areBothDivisibleByThree` that takes two `Int`s as arguments and returns `true` if both are divisible by the number 3 (i.e. there is no remainder after having done the division), `false` otherwise.
 3. Use `doesApply` in combination with `areBothDivisibleByThree` to figure out whether 47685 and 344832 are both divisible by the number 3.
 4. Use `doesApply` to figure out whether 85436 and 53893 are both divisible by three but passing the third argument as a closure (so you can't use the previously defined `areBothDivisibleByThree` any more).
 5. Use `doesApply` to find out if the sums of the digits of `a` and `b` are the same (you can use the function `sumOfDigits` that is defined above for this task).
 6. Write a function called `manipulateStrings` that returns an _optional_ `String` (so, the return type of the function is `String?`) and takes two `String`s as argument as well as another function that takes two `String`s and returns an _optional_ `String`.
 7. Write a function called `concatenateSmallStrings` that takes two `String`s and returns an _optional_ `String`. If both input arguments have less than 5 characters, return the two `String`s concatenated, otherwise return `nil`.
 8. Use the `manipulateStrings` function in combination with the `concatenateSmallStrings` and try to concatenate `"abc"` and `"def"` as well as `"abcdef"` and `"ghijkl"`. What do the calls return?
 */

//  1. Write a function called `doesApply` that returns a `Bool` and takes as arguments two `Int`s as well as a _function_ which again also takes two `Int`s and returns a `Bool`.

func doesApply(x: Int, y: Int, myFunction: (Int, Int) -> Bool) -> Bool {
    let result = myFunction(x, y)
    return result
}

//  2. Write a function called `areBothDivisibleByThree` that takes two `Int`s as arguments and returns `true` if both are divisible by the number 3 (i.e. there is no remainder after having done the division), `false` otherwise.

func areBothDivisibleByThree(x: Int, y: Int) -> Bool{
    var total = 0
    total += x % 3
    total += y % 3
    if total != 0 {
        return false
    } else {
        return true
    }
}

// 3. Use `doesApply` in combination with `areBothDivisibleByThree` to figure out whether 47685 and 344832 are both divisible by the number 3.

doesApply(x: 47685, y: 344832, myFunction: areBothDivisibleByThree)

// 4. Use `doesApply` to figure out whether 85436 and 53893 are both divisible by three but passing the third argument as a closure (so you can't use the previously defined `areBothDivisibleByThree` any more).

doesApply(x: 85436, y: 53893, myFunction: {(first: Int, second: Int) -> Bool in
    var total = 0
    total += first % 3
    total += second % 3
    if total != 0 {
        return false
    } else {
        return true
    }
})

// 5. Use `doesApply` to find out if the sums of the digits of `a` and `b` are the same (you can use the function `sumOfDigits` that is defined above for this task).
doesApply(x: 234, y: 324, myFunction: {(x: Int, y: Int) -> Bool in
    if sumOfDigits(a: x) == sumOfDigits(a: y) {
        return true
    } else {
        return false
    }
})

doesApply(x: 234, y: 324) { (a, b) -> Bool in
    return sumOfDigits(a: a) == sumOfDigits(a: b)
}

// 6. Write a function called `manipulateStrings` that returns an _optional_ `String` (so, the return type of the function is `String?`) and takes two `String`s as argument as well as another function that takes two `String`s and returns an _optional_ `String`.

func manipulateStrings(stringOne: String, stringTwo: String, myFunction: (String, String) -> String?) -> String? {
    let result = myFunction(stringOne, stringTwo)
    return result
}

// 7. Write a function called `concatenateSmallStrings` that takes two `String`s and returns an _optional_ `String`. If both input arguments have less than 5 characters, return the two `String`s concatenated, otherwise return `nil`.

func concatenateSmallStrings(stringOne: String, stringTwo: String) -> String? {
    if stringOne.count < 5 && stringTwo.count < 5 {
        return stringOne + stringTwo
    } else {
        return nil
    }
}
// 8. Use the `manipulateStrings` function in combination with the `concatenateSmallStrings` and try to concatenate `"abc"` and `"def"` as well as `"abcdef"` and `"ghijkl"`. What do the calls return?

manipulateStrings(stringOne: "abc", stringTwo: "def", myFunction: concatenateSmallStrings)
manipulateStrings(stringOne: "abcdef", stringTwo: "ghjkl", myFunction: concatenateSmallStrings)











