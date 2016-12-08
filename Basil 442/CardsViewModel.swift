//
//  CardsViewModel.swift
//  Basil 442
//
//  Created by Other on 12/7/16.
//  Copyright © 2016 team danko_. All rights reserved.
//

import Foundation

class CardsViewModel {
    let q: String?
    
    init(query: String?) {
        self.q = query
    }
    
    func query() -> String {
        return self.q!
    }
}