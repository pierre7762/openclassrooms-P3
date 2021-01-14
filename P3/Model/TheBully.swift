//
//  TheBully.swift
//  P3_01_Xcode
//
//  Created by Pierre Lemère on 07/01/2021.
//

import Foundation

class TheBully: Fighter {
    
    // Weapons name management
        var weaponName: String {
            switch self.weaponPower {
            case .low:
                return "Wooden baseball bat"
            case .normal:
                return "Metal baseball bat"
            case .powerfull:
                return "War Hammer"
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
    init(name: String, life:Int = 150,lifeMax: Int = 150, dodge:Int = 10) {
        super.init(typeName: .TheBully, name: name, life: life, lifeMax: lifeMax, weaponPower: .normal, dodge: 10, criticalHitPercentage: 20, minDamage: 80, damage: 100, maxDamage: 150 )
        }
        
   
}
