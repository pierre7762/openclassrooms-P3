//
//  Fighter.swift
//  P3_01_Xcode
//
//  Created by Pierre Lemère on 05/01/2021.
//

import Foundation

class Fighter {
    var typeName: typeName
    var name: String
    var life: Int
    var lifeMax: Int
    var weaponPower: weaponPower
    var dodge: Int
    var criticalHitPercentage: Int
    var minDamage: Int
    var damage: Int
    var maxDamage: Int
    var isDead = false

    
    init(typeName: typeName, name: String, life: Int, lifeMax: Int, weaponPower: weaponPower, dodge: Int, criticalHitPercentage: Int, minDamage: Int, damage: Int, maxDamage: Int){
        self.typeName = typeName
        self.name = name
        self.life = life
        self.lifeMax = lifeMax
        self.weaponPower = .normal
        self.dodge = dodge
        self.criticalHitPercentage = criticalHitPercentage
        self.minDamage = minDamage
        self.damage = damage
        self.maxDamage = maxDamage
        
    }
    
    enum weaponPower: String {
        case low
        case normal
        case powerfull
    }
    
    enum typeName {
        case TheBoxer, TheThinBlade, TheBully
    }
    
    func damagePointAttack() -> Int{
        // We seek the maximum attack with the weapon held
        var maxAttackPotentiel = 0
        switch self.weaponPower {
        case .low:
            maxAttackPotentiel = minDamage
        case .normal:
            maxAttackPotentiel = damage
        case .powerfull:
            maxAttackPotentiel = maxDamage
        }
        
        // Calculation of damage points in relation to the attacker's accuracy
        var damagepoints = maxAttackPotentiel
        
        let randomPrecision = Int.random(in: 1..<100)
        if randomPrecision > criticalHitPercentage {
            damagepoints = damagepoints - (Int(Double(damagepoints) * 0.2))
        }
        
        return damagepoints
    }
    
    func isItToDodge() -> Bool{
        let randomDodge = Int.random(in: 1..<100)
        if randomDodge > dodge {
            print("se prend le coup")
            return false
        }
        else {
            print("esquive")
            return true
        }
        
    }
    
    func treadWounded(target: Fighter){
        let care = Int(Double(target.life) * 0.2)
        if ((target.life + care) <= lifeMax){
            life += care
        } else {
            life = lifeMax
        }
    }
    
    
    static func createFighterChoice() -> Fighter{
        print(Text.getText()["createFighter"]!)
        //choice the type
        print(Text.getText()["fighterType"]!)
        var choiceTypeOne = Int(readLine()!)
        if choiceTypeOne == nil{
            //while the user don't write a word the question loop
            while choiceTypeOne == nil {
                print(Text.getText()["fighterType"]!)
                choiceTypeOne = Int(readLine()!)
            }
        }
        
        //choice the fighter name
        print(Text.getText()["fighterName"]!)
        var fighterName = readLine()!
        if fighterName == ""{
            //while the user don't write a word the question loop
            while fighterName == "" {
                print(Text.getText()["fighterName"]!)
                fighterName = readLine()!
            }
        }
        
        
        //creation of the fighter
        var typeOne: Fighter
        switch choiceTypeOne {
        case 1:
            typeOne = TheBoxer(name: fighterName)
        case 2:
            typeOne = TheThinBlade(name: fighterName)
        case 3:
            typeOne = TheBully(name: fighterName)
        default:
            typeOne = TheBoxer(name: fighterName)
        }
        
        let fighter = typeOne
        fighter.name = fighterName
        
        return fighter
        
    }

}


