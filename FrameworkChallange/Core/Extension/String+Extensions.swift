//
//  String+Extensions.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 17/02/22.
//

import Foundation

extension String {
    
    var translate: String {
        get {
            return TranslationHelper.translate(self)
        }
    }
    
}
