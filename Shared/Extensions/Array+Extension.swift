//
//  Array+Extension.swift
//  KingsCup (iOS)
//
//  Created by Sherry Xu on 2021-12-28.
//

import Foundation

extension Array {
    func copiedElements() -> Array<Element> {
        return self.map{
            let copiable = $0 as! NSCopying
            return copiable.copy() as! Element
        }
    }
}
