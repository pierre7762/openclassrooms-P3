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
    
    func maxAttackPotentielCal() -> Int{
        var maxAttackPotentiel = 0
        switch self.weaponPower {
        case .low:
            maxAttackPotentiel = minDamage
        case .normal:
            maxAttackPotentiel = damage
        case .powerfull:
            maxAttackPotentiel = maxDamage
        }
        return maxAttackPotentiel
    }
    
    func damagePointAttack() -> Int{
        // We seek the maximum attack with the weapon held
        let maxAttackPotentiel = maxAttackPotentielCal()
        
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
            return false
        }
        else {
            return true
        }
        
    }
    
    func heal(target: Fighter){
        let care = Int(Double(target.life) * 0.2)
        if ((target.life + care) <= lifeMax){
            target.life += care
            print("\(target.name) recovers \(care) life points ! (\(target.life)/\(target.lifeMax))")
        } else {
            life = lifeMax
            print("\(target.name) is fully recovered ! (\(target.life)/\(target.lifeMax))")
        }
    }
    
    
    static func createFighterChoice(listName: [String]) -> Fighter{
        
        //choice the fighter name
        print(Text.getText(key: "fighterName"))
        var fighterName = readLine()!
        
        // we cheak if the name is good
        var isOk = false
        
        while isOk == false {
            if fighterName == ""{
                print("Please write the name you want to give to the fighter")
                fighterName = readLine()!
            } else {
                isOk = true
            }
            
            //check if the name is already in use
            for n in listName {
                if n == fighterName {
                    print("\(Text.getText(key: "existingName"))")
                    print(Text.getText(key: "fighterName"))
                    fighterName = readLine()!
                    
                    isOk = false
                } else {
                    isOk = true
                }
            }
        }
        
        print(Text.getText(key: "createFighter"))
        //choice the type
        print(Text.getText(key: "fighterType"))
        var choiceTypeOne = Int(readLine() ?? "")
        if choiceTypeOne == nil{
            //while the user don't write a word the question loop
            while choiceTypeOne == nil {
                print(Text.getText(key: "fighterType"))
                choiceTypeOne = Int(readLine()!)
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



