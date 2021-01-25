//
//  TheBoxer.swift
//  P3_01_Xcode
//
//  Created by Pierre Lemère on 07/01/2021.
//

import Foundation

class TheBoxer: Fighter {
/* Initialization of the parameters inherited from the mother class :
- name
- life
- weapon power
- dodge
- precision
 */
    init(name: String) {
        super.init(typeName: .TheBoxer,
                   name: name,
                   life: 100,
                   lifeMax: 100,
                   weaponPower: .normal,
                   dodge: 60,
                   criticalHitPercentage: 90,
                   minDamage: 40,
                   damage: 60,
                   maxDamage: 80)
    }
      
}


