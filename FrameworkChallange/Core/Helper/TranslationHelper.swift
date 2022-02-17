//
//  TranslationHelper.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 17/02/22.
//

import Foundation

class TranslationHelper {
    
    class func translate(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
}
