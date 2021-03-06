//
//  URL.swift
//  Client_test
//
//  Created by Kohei Oyama on 2017/04/12.
//  Copyright © 2017年 Oyama. All rights reserved.
//

import Foundation

enum myURL {
    
    case Local
    case Finatext
    case Hirose
    case Ist
    case MyHome
    case Deploy
    
    var url: URL {
        let local: String = "ws://localhost:3000"
        let finatext: String = "ws://192.168.12.126:3000"
        let hirose: String = "ws://157.82.6.194:3000"
        let ist: String = "ws://157.82.4.137:3000"
        let myhome: String = "ws://192.168.11.5:3000"
        let deploy: String = "ws://52.192.242.171:80"
        
        switch self {
        case .Local:
            return URL(string: "\(local)/cable")!
        case .Finatext:
            return URL(string: "\(finatext)/cable")!
        case .Hirose:
            return URL(string: "\(hirose)/cable")!
        case .Ist:
            return URL(string: "\(ist)/cable")!
        case .MyHome:
            return URL(string: "\(myhome)/cable")!
        case .Deploy:
            return URL(string: "\(deploy)/cable")!
        }
    }
}
