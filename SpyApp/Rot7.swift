//
//  Rot7.swift
//  SpyApp
//
//  Created by Divyaraj Bakrola on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//


import Foundation


struct ROT7: Cipher
{
    
    func encode(_ plaintext: String, secret: String) -> String
    {
        
        if (plaintext.isEmpty || isANumeric (plaintext) )
        {
            return "Invalid entry"
        }
        
        
        var encoded = ""
        var shiftBy = UInt32("7")!
        
        for character in plaintext
        {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decode(_ plaintext: String, secret: String) -> String
    {
        
        var decoded = ""
        var unShiftBy = UInt32("7")!
        
        for character in plaintext
        {
            
            let unicode = character.unicodeScalars.first!.value
            
            let char = unicode - unShiftBy
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(char)))
            decoded = decoded + shiftedCharacter
        }
        
        
        return decoded
    }
    
    func isANumeric (_ key: String) -> Bool
    {
        
        var AlphaCheck = false
        
        var NumberCheck = false
        
        let NewKey = key.uppercased()
        
        for character in NewKey
        {
            
            
            if (character.unicodeScalars.first!.value >= 65 && character.unicodeScalars.first!.value <= 90)
            {
                AlphaCheck = true
            }
                
            else
            {
                if  UInt32(String(character)) != nil
                {
                    NumberCheck = true
                }
            }
        }
        
        return AlphaCheck && NumberCheck
        
}

}

