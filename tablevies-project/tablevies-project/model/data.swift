//
//  data.swift
//  tablevies-project
//
//  Created by Fabian Kirchmann / BBS2H20A on 21.12.21.
//

import Foundation
let KanzlerData = loadData()

func loadData() -> [kanzlermodel]{
    var data: Data
    
    guard let file = Bundle.main.url(forResource: "data", withExtension: "json")else{
        fatalError("json error")
    }
    data = try! Data(contentsOf: file)
    
    let decoder = JSONDecoder()
    return try! decoder.decode([kanzlermodel].self, from: data)
}
