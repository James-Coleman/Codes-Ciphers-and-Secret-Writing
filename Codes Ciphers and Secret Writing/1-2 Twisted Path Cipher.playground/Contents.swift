import UIKit

var greeting = "Hello, playground"

func twistedPathCipher(plainText: String) -> String {
    var cleanText = plainText.filter { $0.isWhitespace == false }
    
    let additionalNeededCharactersMod = cleanText.count % 4
    
    if additionalNeededCharactersMod != 0 {
        let neededCharacterCount = 4 - additionalNeededCharactersMod
        for _ in 1...neededCharacterCount {
            let randomCharacter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".randomElement()!
            cleanText += String(randomCharacter)
        }
    }
    
    let mod = cleanText.count / 4
    
    var arrays = [[String]]()
    
    var nextArray = [String]()
    
    for (index, character) in cleanText.enumerated() {
        if index % mod == 0 && nextArray.isEmpty == false {
            arrays += [nextArray]
            nextArray = []
        }
        
        nextArray += [String(character)]
    }
    
    arrays += [nextArray]
    
    for (index, array) in arrays.enumerated() {
        arrays[index] = array.reversed()
    }
    
    arrays.reverse()
    
    var completeText = ""
    
    for index in 0..<mod {
        for array in arrays {
            completeText += array[index]
        }
    }
    
    var withSpaces = ""
    
    for (index, character) in completeText.enumerated() {
        withSpaces += String(character)
        
        if (index + 1) % 4 == 0 && index != (completeText.count - 1) {
            withSpaces += " "
        }
    }
    
    return withSpaces
}

twistedPathCipher(plainText: "MEET ME THURSDAY NIGHT")

func twistedPathDecipher(cipherText: String) -> String {
    let cleanText = cipherText.filter { $0.isWhitespace == false }
    
    var arrays = [[String]]()
    
    var nextArray = [String]()
    
    for (index, character) in cleanText.enumerated() {
        if index % 4 == 0 && nextArray.isEmpty == false {
            arrays += [nextArray]
            nextArray = []
        }
        
        nextArray += [String(character)]
    }
    
    arrays += [nextArray]
    
    print(arrays)
    
    for (index, array) in arrays.enumerated() {
        arrays[index] = array.reversed()
    }
    
    arrays.reverse()
    
    print(arrays)
    
    var completeText = ""
    
    for index in 0..<4 {
        for array in arrays {
            completeText += array[index]
        }
    }
    
    return completeText
}

twistedPathDecipher(cipherText: "HNRM TYUT HAHE GDTE ISEM")
