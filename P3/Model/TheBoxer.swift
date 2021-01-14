//
//  TheBoxer.swift
//  P3_01_Xcode
//
//  Created by Pierre Lemère on 07/01/2021.
//

import Foundation


class TheBoxer: Fighter {
    
// Weapons name management
    var weaponName: String {
        switch self.weaponPower {
        case .low:
            return "Bare hands"
        case .normal:
            return "Brass knuckles"
        case .powerfull:
            return "Steel gloves"
        }
    }
    
/* Initialization of the parameters inherited from the mother class :
- name
- life
- weapon power
- dodge
- precision
 */
    init(name: String) {
        super.init(typeName: .TheBoxer, name: name, life: 100, lifeMax: 100, weaponPower: .normal, dodge: 50, criticalHitPercentage: 90, minDamage: 40, damage: 60,maxDamage: 80)
    }
    
    
}


