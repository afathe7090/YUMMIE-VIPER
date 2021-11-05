//
//  String+Extention.swift
//  Yummie
//
//  Created by Ahmed Fathy on 10/10/2021.
//

import Foundation

extension String{
    var asURL: URL? {
        return URL(string: self)
    }
}
