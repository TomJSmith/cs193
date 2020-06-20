//
//  Array+Only.swift
//  Memorize
//
//  Created by Thomas Smith on 2020-06-19.
//  Copyright © 2020 Thomas Smith. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
