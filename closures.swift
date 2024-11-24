//CLOSURES

// let names = {
//     (name: String) in
//     print(name)
// }

// names("John")
// names("Doe")
// names("Jane")
// names("Doe")


// let a = 1004
// let b = 241

// func operation(_ a: Int, _ b: Int, _ action: (Int, Int) -> Int) -> Int{
     
//     return action(a, b)
// }

// let result = operation(a, b, {(a, b) in a * b})
// print(result)


// let result = operation(a,b , {$0 * $1})
// print(result)

// let result = operation(a, b, *)
// print(result)


var a = 26
var b = 5

// let result: () -> Int = { return a * b}
// print(result())

let result1: () -> Int = {[a, b] in return a * b}
print(result1())

a = 4
b = 2
print(result1())
// print(result())



