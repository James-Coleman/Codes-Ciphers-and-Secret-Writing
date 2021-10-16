import UIKit

var greeting = "Hello, playground"

func railFenceCipher(plainText: String) -> String {
    var cleanText = plainText.filter { $0.isWhitespace == false }
    
    let additionalNeededCharactersMod = cleanText.count % 4
    
    if additionalNeededCharactersMod != 0 {
        let neededCharacterCount = 4 - additionalNeededCharactersMod
        for _ in 1...neededCharacterCount {
            let randomCharacter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".randomElement()!
            cleanText += String(randomCharacter)
        }
    }
    
    var topHalf = ""
    var bottomHalf = ""
    
    for (index, character) in cleanText.enumerated() {
        if index.isMultiple(of: 2) {
            topHalf += String(character)
        } else {
            bottomHalf += String(character)
        }
    }
    
    let completeText = topHalf + bottomHalf
    
    var withSpaces = ""
    
    for (index, character) in completeText.enumerated() {
        withSpaces += String(character)
        
        if (index + 1) % 4 == 0 && index != (completeText.count - 1) {
            withSpaces += " "
        }
    }
    
    return withSpaces
}

railFenceCipher(plainText: "MEET ME TONIGHT")
