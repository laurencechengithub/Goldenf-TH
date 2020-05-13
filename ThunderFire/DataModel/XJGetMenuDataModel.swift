//
//  XJGetMenuDataModel.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 5/12/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import Foundation

struct XJGetMenuDataModel: Codable {
    let cpid: Int
    let em, im: [EmData]
    let pt: Int
    let pm: [EmData]
    let pi: [PiData]
    let k: Int
    let tm: [EmData]
    let bt: String
    let v: Int
}



struct EmData: Codable {
    let k: Int
    let n: String
    let ec: Int
    let hi: Bool
    let ml: [MlData]?
}


struct MlData: Codable {
    let n, bt: String
    let ec: Int
}

struct PiData: Codable {
    let k: Int
    let n: String
}
