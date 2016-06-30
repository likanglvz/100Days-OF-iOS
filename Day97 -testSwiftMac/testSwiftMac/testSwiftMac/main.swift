//
//  main.swift
//  testSwiftMac
//
//  Created by baiheng on 16/6/7.
//  Copyright © 2016年 baiheng. All rights reserved.
//

import Foundation
//打印语句
print("Hello, World!")
print("Hello World")

//常量,s1常量名，不可变
let s1:String = "Hello World"
let ss = ""

//变量
var s2 = "Hello World"


//字符串
//声明
let someString = "Some string literal value"
//空串
var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    print("Nothing to see here")
    
}

//可变字符串
var variableString = "Horse"
variableString += " and carriage"
print(variableString)


//someString += "some"

//字符处理
for character in "Dog!🐶".characters{
    print(character)
    
}

let mark:Character = "!"
//字符数组－－》字符串
let catCharacters:[Character] = ["C","a","t","!","🐱"]
let catString = String(catCharacters)
print(catString)

//字符串连接
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2
print(instruction)

welcome.append(mark)
print(welcome)

//字符替换
let multipier = 3
let message = "\(multipier) times 2.5 is \(Double(multipier)*2.5) "
print(message)


//使用count函数得到字符数
let unusual = "Koala, Snail, Penguin, Dromedary"
print("unusual has \(unusual.characters.count)")


//索引String 用index访问
let greeting = "Gao taichang!"

greeting[greeting.startIndex]
print(greeting[greeting.startIndex])

greeting[greeting.endIndex.predecessor()]
print(greeting[greeting.endIndex.predecessor()])

greeting[greeting.startIndex.successor()]
print(greeting[greeting.startIndex.successor()])

let index = greeting.startIndex.advancedBy(7)

print(greeting[index])

//索引的范围
for index in greeting.characters.indices{
    print("\(greeting[index]) ", terminator:"")
    
}
print("\n")

//插入删除
var welcome1 = "hello"
welcome1.insert("!", atIndex: welcome1.endIndex)
print(welcome1)

//在指定索引上插入字符串
welcome1.insertContentsOf(" there".characters, at: welcome1.endIndex.predecessor())
print(welcome1)

//移除特定索引上的字符
welcome1.removeAtIndex(welcome1.endIndex.predecessor())
print(welcome1)

//移除索引范围内的子串
let range = welcome1.endIndex.advancedBy(-6)..<welcome1.endIndex
welcome1.removeRange(range)
print(welcome1)

//比较字符串
let quotation = "We're a lot alike, you and I"
let sameQuotation = "We're a lot alike, you and I"
if quotation == sameQuotation{
    print("these two strings are equal")
    
}


//Tuples 元组，组合值，有序的值列表 如（Int，Int，Int）

let http404Error = (404,"Not Found")//(Int,String)
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (justTheStatusCode, _) = http404Error


//Optionals, 选配？！
//此概念在c或oc中不存在，与oc中最接近的概念是：方法可能返回对象或者nil。返回nil意味着对象没有出现。但仅仅对对象起作用。在swift中optional会让你标记不出现的值，不管是什么类型

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
//convertedNumber是Int?类型，选配类型，意味着其中要么是int，要么是空nil

//swift中nil和Oc中的nil有区别，oc是一个指向不存在对象的指针，swift不是指针，表示值不存在
var serverResponseCode:Int? = 404
serverResponseCode = nil

var surveyAnswer:String?

//判断有无值，如果确定选配类型中有值，使用！读取
if convertedNumber != nil {
    print("converNumber has an integer value of \(convertedNumber!)")
}


//运算符 ===, !==, 比较地址


//Nil Coalescing Operator,空合运算符 a ?? b, a是optional，如果a中有值，那么a？？b返回a的值；如果a为nil，返回b。 a! = nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName:String? //默认值为nil

var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"

colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)


//范围操作符 （a...b）(a..<b)

for index in 1..<5 {
    print("\(index) times 5 is \(index * 5)")
    
}


//array数组
var someInts = [Int]()
someInts.append(3)
print("someINts is of Type [Int] with \(someInts.count) items")

someInts = []

//初始化，3个元素，0.0 0.0 0.0
var threeDoubles = [Double](count: 3, repeatedValue: 0.0)

var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)

var sixDoubles = threeDoubles + anotherThreeDoubles//[0.0,0.0,0.0,2.5.2.5,2.5]

//又一种初始化
var shoppingList = ["Eggs","Milk"]

if shoppingList.isEmpty {
    print("empty")
}else{
    print("not empty")
}

//添加元素到数组末尾
shoppingList.append("Flour")

shoppingList += ["Baking Powder"]


shoppingList += ["Chocolate Spread","Cheese","Butter"]


//通过下标读写
var firstItem = shoppingList[0]
print(firstItem)

shoppingList[0] = "Six eggs"


shoppingList[4...6] = ["Bananas","Apples"]//6 items in array

//插入元素

shoppingList.insert("Maple Syrup", atIndex: 0)

//移除元素
let mapleSyrup = shoppingList.removeAtIndex(0)
print(mapleSyrup)

firstItem = shoppingList[0]
print(firstItem)

let apples = shoppingList.removeLast()


//数组遍历
for item in shoppingList{
    print(item)
    
}

for (index,value) in shoppingList.enumerate(){
    print("item \(index) : \(value)")
}


//集合

var letters = Set<Character>()

letters.insert("a")
print("\(letters.count) items")
//置空
letters = []

//初始化的一种
var favoriteGenres: Set<String> = ["Rock","Classical","Hip hop"]

if favoriteGenres.isEmpty{
    print("empty")
}else
{
    print("Not empty")
    
    
}

//添加元素
favoriteGenres.insert("Jazz")

//移除
if let removedGenre = favoriteGenres.remove("Rock"){
    print("\(removedGenre), I'm over it.")
}else
{
    print("I never much cared for that")
}

//集合是否包含特定值
if favoriteGenres.contains("Funk"){
    print("")
}else
{
    
}

//遍历
for genre in favoriteGenres{
    print("\(genre)")
    
}


for genre in favoriteGenres.sort(){
    print("\(genre)")

}

//集合的运算

let oddDigits:Set = [1,3,5,7,9]
let evenDigits:Set = [0,2,4,6,8]

let singleDigitPrimeNubers:Set = [2,3,5,7]

oddDigits.union(evenDigits).sort()

print(oddDigits.union(evenDigits).sort())

oddDigits.intersect(evenDigits).sort()

print(oddDigits.intersect(evenDigits).sort())

print( oddDigits.subtract(singleDigitPrimeNubers))


//字典

//初始化
var namesOfIntegers = [Int:String]()
//键值对
namesOfIntegers[16] = "sixteen"
//置空
namesOfIntegers = [:]


var airports:[String:String] = ["YYZ":"Toronto Pearson","DUB":"Dublin"]

print("\(airports.count) items")

//判断空 isEmpty
//使用下标语法添加键值对
airports["LHR"] = "London"

//更新键值对，返回老值
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB"){
 print(oldValue)
    
}

airports["APL"] = "Apple Internationl"
//删除一个键值对
airports["APL"] = nil

//删除键值对，返回删掉掉值
if let removedValue = airports.removeValueForKey("DUB"){
    
}

//遍历
for (airportCode,airportName) in airports
{
    print("\(airportCode):\(airportName)")
    
}


for airportCode in airports.keys{
    
}

for airportName in airports.values{
    
}
//所有键名放入数组
let airportCodes = [String](airports.keys)



//流控制

for index in 1...5{
    
}

let base = 3
let power = 10
var answer = 1

for _ in 1...power{
    answer *= base
}

for var index = 0; index < 3; ++index{
    
}


//没有break
let someCharacter:Character = "e"
switch someCharacter{

    case "a","e","i","o","u":
        print("\(someCharacter) is a vowel")
    
    case "b","c","d":
        print("\(someCharacter) is a consonant")
    
default:
    
    print("\(someCharacter) is not a consonant or a vowel")
    
}

//case条件可以用范围case 0: case 1...3: case 4...9，
//case可以用元组：case （0,0）: case (_,0): case (-2...2,-2...2)
//switch中加入where条件
let point = (1,-1)
switch point{
case let (x,y) where x==y:
    print("on the line x==y")
    
case let (x,y) where x == -y:
    print("on the line x==-y")
  //  fallthrough 关键字
default:
    print("")
    
}



//函数

func sayHello(personName: String) -> String
{
    let greeting = "Hello, " + personName + "!"
    return greeting
}

print(sayHello("大圣"))

//多参数    1..<10,
func halfOpenRangeLength(start: Int, end:Int) -> Int
{
    return end - start

}
print(halfOpenRangeLength(1, end: 10))

//多返回值,用元组类型

func minMax(array:[Int]) -> (min: Int, max: Int)
{
    var currentMin = array[0]
    var currentMax = array[0];
    
    for value in array[1..<array.count] {
        if value < currentMin{
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    
    }
    
    return (currentMin,currentMax)
    
}

let bounds = minMax([8,-5,4,103,34,2])

print("min is \(bounds.min) and max is \(bounds.max)")





