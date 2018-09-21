//
//  AlphanumericCesarCipher.swift
//  SpyApp
//
//  Created by Divyaraj Bakrola on 9/12/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct AlphaNumericCesarCipher: Cipher
{
    
    func encode(_ plaintext: String, secret: String) -> String
    {
        
        var encoded = ""
        if (isANumeric(plaintext))
            {
            if Int32(secret) == nil {
                return "Enter a valid shift key"
            }
            if Int32(secret) == 0
            {
                return "The shift key should be more than 0"
            }
            var ShiftByChar = Int32(secret)!
            var ShiftByDigit = Int32(secret)!
            if ShiftByChar <= -26
            {
                ShiftByChar = Int32(secret)! % -26
            }
            if ShiftByChar >= 26
            {
                ShiftByChar = Int32(secret)! % 26
            }
            if ShiftByDigit <= -9
            {
                ShiftByDigit = Int32(secret)! % -9
            }
            if ShiftByDigit >= 9
            {
                ShiftByDigit = Int32(secret)! % 9
            }
            print("Char: \(ShiftByChar)")
            let NewTxt = plaintext.uppercased()
            print ("Digit: \(ShiftByDigit)")
                
        for character in NewTxt
        {
            let unicode = character.unicodeScalars.first!.value
            //print ("Unicode: \(unicode)")
            if TestChar(character) {
                var shiftedUnicode = Int32(unicode) + ShiftByChar
                if (shiftedUnicode < 65) {
                    let toActuallyShift = 64 - shiftedUnicode
                     shiftedUnicode = 90 - toActuallyShift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                   // print ("ShiftedUnicode < 65: \(shiftedUnicode)")
                    continue
                }
                 else if (shiftedUnicode > 90)
                {
                    let toActuallyShift = shiftedUnicode - 90
                     shiftedUnicode = 64 + toActuallyShift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                   // print ("ShiftedUnicode > 90: \(shiftedUnicode)")
                     continue
                }
                    
                else
                {
                let shiftedUnicode = Int32(unicode) + ShiftByChar
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
              //  print ("ShiftedUnicode neutral: \(shiftedUnicode)")
                }
            }
            else
            {
                var shiftedUnicode = Int32(unicode) + ShiftByDigit
                print("shifted: \(shiftedUnicode)")
                if (shiftedUnicode < 48) {
                    let toActuallyShift = 47 - shiftedUnicode
                    shiftedUnicode = 57 - toActuallyShift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    continue
                }
                if (shiftedUnicode > 57)
                {
                    let toActuallyShift = shiftedUnicode - 57
                    shiftedUnicode = 47 + toActuallyShift
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                    continue
                }
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
                print ("ShiftedUnicode neutral: \(shiftedUnicode)")
            }
        }
                
        }
        else
        {
            print(plaintext)
            return "Please enter a valid alpha numeric string"
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String
    {
        
        var decoded = ""
        if (isANumeric(plaintext))
        {
            if Int32(secret) == nil
            {
                return "Enter a valid shift key"
            }
            if Int32(secret) == 0
            {
                return "The shift key should be more than 0"
            }
            var ShiftByChar = Int32(secret)!
            var ShiftByDigit = Int32(secret)!
            if ShiftByChar <= -26
            {
                ShiftByChar = Int32(secret)! % -26
            }
            if ShiftByChar >= 26
            {
                ShiftByChar = Int32(secret)! % 26
            }
            if ShiftByDigit <= -9
            {
                ShiftByDigit = Int32(secret)! % -9
            }
            if ShiftByDigit >= 9
            {
                ShiftByDigit = Int32(secret)! % 9
            }
            print("Char: \(ShiftByChar)")
            let NewTxt = plaintext.uppercased()
            print ("Digit: \(ShiftByDigit)")
            for character in NewTxt
            {
                let unicode = character.unicodeScalars.first!.value
                print ("Unicode: \(unicode)")
                if TestChar(character)
                {
                    var shiftedUnicode = Int32(unicode) - ShiftByChar
                    if (shiftedUnicode < 65)
                    {
                        let toActuallyShift = 64 - shiftedUnicode
                        shiftedUnicode = 90 - toActuallyShift
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                       // print ("ShiftedUnicode < 65: \(shiftedUnicode)")
                        continue
                    }
                        
                    else if (shiftedUnicode > 90)
                    {
                        let toActuallyShift = shiftedUnicode - 90
                        shiftedUnicode = 64 + toActuallyShift
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                       // print ("ShiftedUnicode > 90: \(shiftedUnicode)")
                        continue
                    }
                        
                    else
                    {
                        let shiftedUnicode = Int32(unicode) - ShiftByChar
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                       // print ("ShiftedUnicode neutral: \(shiftedUnicode)")
                    }
                }
                    
                else
                {
                    var shiftedUnicode = Int32(unicode) - ShiftByDigit
                    if (shiftedUnicode < 48)
                    {
                        let toActuallyShift = 47 - shiftedUnicode
                        shiftedUnicode = 57 + toActuallyShift
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                        continue
                    }
                    if (shiftedUnicode > 57)
                    {
                        let toActuallyShift = shiftedUnicode - 57
                        shiftedUnicode = 47 + toActuallyShift
                        let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                        decoded = decoded + shiftedCharacter
                        continue
                    }
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    decoded = decoded + shiftedCharacter
                    print ("ShiftedUnicode neutral: \(shiftedUnicode)")
                }
            }
        }
        else
        {
            print(plaintext)
            return "Please enter a valid alpha numeric string"
        }
        return decoded
    }
    
    func isANumeric (_ key: String) -> Bool
    {
       
        let NewKey = key.uppercased()
        for character in NewKey {
                if (character.unicodeScalars.first!.value >= 65 && character.unicodeScalars.first!.value <= 90)
                {
                   continue
                }
                else if UInt32(String(character)) != nil
                {
                   continue
                }
                    
                else
                {
                  return false
                }
            
            }
        return true

    }
    
    func TestChar (_ value: Character) -> Bool
    {
        
        if value.unicodeScalars.first!.value >= 65 && value.unicodeScalars.first!.value <= 90
        {
            
            return true
        }
        
        return false
    }
    
}

