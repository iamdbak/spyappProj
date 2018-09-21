import Foundation

struct CipherFactory
{

    private var ciphers: [String: Cipher] = [
        "cesar": CeaserCipher(),
        "alphanumcesar" : AlphaNumericCesarCipher(),
        "rot" : ROT7(),
        "TradeCipher" : TradeCipher()
    ]

    func cipher(for key: String) -> Cipher
    {
        
        return ciphers[key]!
    }
}
