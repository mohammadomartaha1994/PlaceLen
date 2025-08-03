//
//  Untitled.swift
//  PlaceLen
//
//  Created by Mohammad Omar Taha on 2/08/25.
//

import Foundation

struct APICountry: Decodable {
    let name: Name
    let idd: IDD
    let flags: Flags
    let cca2: String
    let flag: String
    
    struct Name: Decodable {
        let common: String
    }
    
    struct IDD: Decodable {
        let root: String?
        let suffixes: [String]?
    }
    
    struct Flags: Decodable {
        let png: String?
        let emoji: String?
    }
}

struct Country: Identifiable, Hashable {
    let id: String           // ISO code
    let name: String
    let dialCode: String
    let flag: String
    
    init?(from api: APICountry) {
        guard let root = api.idd.root else { return nil }
        
        // Use first suffix or empty string
        let suffix = api.idd.suffixes?.first ?? ""
        
        self.id = api.cca2
        self.name = api.name.common
        self.dialCode = root + suffix
        self.flag = api.flag
    }
}
