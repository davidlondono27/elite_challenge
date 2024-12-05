//
//  Validators.swift
//  Common
//
//  Created by David Londono on 05/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import Foundation
import RegexBuilder

public class Validators {
    public static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = Regex {
            OneOrMore {
                CharacterClass(
                    .word,
                    .anyOf("-_")
                )
            }
            "@"
            OneOrMore {
                CharacterClass(
                    .word,
                    .anyOf("-_")
                )
            }
            "."
            OneOrMore(.word)
        }

        return email.contains(emailRegex)
    }

    public static func isValidPassword(_ password: String) -> Bool {
        let validators: [(String) -> Bool] = [
            Validators.capitalLetter,
            Validators.characters,
            Validators.containNumber
        ]

        return validators.allSatisfy { $0(password) }
    }

    public static func characters(_ password: String) -> Bool {
        let strLength = password.count
        return (strLength >= 8 && strLength <= 20)
    }

    public static func capitalLetter(_ password: String) -> Bool {
        let letterRegex = "[A-Z]"
        return password.range(of: letterRegex, options: .regularExpression) != nil
    }

    public static func containNumber(_ password: String) -> Bool {
        let numberRegex = "[0-9]"
        return password.range(of: numberRegex, options: .regularExpression) != nil
    }

    public static func containsSpecialCharacter(_ password: String) -> Bool {
        let specialCharacterRegex = "[!#$%&'()*+,-./:;<=>?@\\[\\]^_`{|}~\\\\\"]"
        return password.range(of: specialCharacterRegex, options: .regularExpression) != nil
    }
}
