//
//  Tradecipher.swift
//  SpyApp
//
//  Created by Divyaraj Bakrola on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct TradeCipher: Cipher
{
    
    func encode(_ plaintext: String, secret: String) -> String
    {
        
        var NewTxt = plaintext
        // dictionary of chars to substitute
        var startAt: UInt32 = 97
        
        if  (!isAlphabet(plaintext))
        {
            
            return "please enter valid text for key"
        }
        
        if  (!isAlphabet(secret))
        {
            
            return "please enter valid text for secret"
        }
        
        if secret.count > 26
        {
            
            return "secret cannot be more than 26 chars [A-Z]"
        }
        
        // replace all a-z chars with secret chars
        
        
        
        for character in secret
        {
            let toReplaceWith = String (character)
            NewTxt = NewTxt.replacingOccurrences(of: String(UnicodeScalar(UInt8(startAt))), with: toReplaceWith, options: NSString.CompareOptions.literal, range: nil)
            
            startAt = startAt + 1
        }
        return NewTxt
    }
    
    
    
    func decode(_ plaintext: String, secret: String) -> String
    {
        
        var NewTxt = plaintext
        var startAt: UInt32 = 97
        
        // replace all a-z chars with secret chars
        
        if  (!isAlphabet(plaintext))
        {
            
            return "please enter valid text for key"
        }
        
        if  (!isAlphabet(secret))
        {
            
            return "please enter valid text for secret"
        }
        
        for character in secret
        {
            let toReplaceWith = String (character)
            NewTxt = NewTxt.replacingOccurrences(of: toReplaceWith, with: String(UnicodeScalar(UInt8(startAt))), options: NSString.CompareOptions.literal, range: nil)
            startAt = startAt + 1
        }
        return NewTxt
    }
    
    func isAlphabet (_ key: String) -> Bool
    {
        var hasAlphabet = true
        let NewKey = key.uppercased()
        for character in NewKey
        {
            if !(character.unicodeScalars.first!.value >= 65 && character.unicodeScalars.first!.value <= 90)
            {
                hasAlphabet = false
            }
        }
        return hasAlphabet
    }
}
