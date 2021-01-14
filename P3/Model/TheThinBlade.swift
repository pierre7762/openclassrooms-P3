//
//  TheThinBlade.swift
//  P3_01_Xcode
//
//  Created by Pierre Lemère on 07/01/2021.
//

import Foundation


class TheThinBlade: Fighter {
        
    // Weapons name management
        var weaponName: String {
            switch self.weaponPower {
            case .low:
                return "Knif"
            case .normal:
                return "Sword"
            case .powerfull:
                return "Two handed sword"
            }
        }
        
    /* Initialization of the parameters inherited from the mother class :
    - name
    - life
    - weapon power
    - dodge
    - precision
    - damages
     */
        init(name: String) {
            super.init(typeName: .TheThinBlade, name: name, life: 80, lifeMax: 80, weaponPower: .normal, dodge: 40, criticalHitPercentage: 50, minDamage: 60, damage: 80, maxDamage: 100)
        }
}
