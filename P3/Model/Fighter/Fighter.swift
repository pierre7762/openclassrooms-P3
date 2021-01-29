//
//  Fighter.swift
//  P3_01_Xcode
//
//  Created by Pierre Lemère on 05/01/2021.
//

import Foundation

class Fighter {
    var typeName: TypeName
    var name: String
    var life: Int
    var lifeMax: Int
    var weaponPower: WeaponPower
    var dodge: Int
    var criticalHitPercentage: Int
    var minDamage: Int
    var damage: Int
    var maxDamage: Int
    var isDead = false
     
    init(typeName: TypeName, name: String, life: Int, lifeMax: Int, weaponPower: WeaponPower, dodge: Int, criticalHitPercentage: Int, minDamage: Int, damage: Int, maxDamage: Int) {
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
    
    enum WeaponPower: String {
        case low
        case normal
        case powerfull
    }
    
    enum TypeName {
        case TheBoxer, TheThinBlade, TheBully
    }
    
    func getMaxAttackPotentiel() -> Int {
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
    
    func getDamagePointAttack() -> Int {
        // We seek the maximum attack with the weapon held
        let maxAttackPotentiel = getMaxAttackPotentiel()
        
        // Calculation of damage points in relation to the attacker's accuracy
        var damagepoints = maxAttackPotentiel
        
        let randomPrecision = Int.random(in: 1..<100)
        if randomPrecision > criticalHitPercentage {
            damagepoints = damagepoints - (Int(Double(damagepoints) * 0.2))
        }
        
        return damagepoints
    }
    
    func isItToDodge() -> Bool {
        let randomDodge = Int.random(in: 1..<100)
        if randomDodge > dodge {
            return false
        }
        else {
            return true
        }
    }
    
    private func heal(target: Fighter) {
        let care = Int(Double(target.life) * 0.2)
        if ((target.life + care) <= lifeMax) {
            target.life += care
            print("\(target.name) recovers \(care) life points ! (\(target.life)/\(target.lifeMax)) /n")
        } else {
            life = lifeMax
            print("\(target.name) is fully recovered ! (\(target.life)/\(target.lifeMax)) /n")
        }
    }
    
    
    static func createFighterChoice(listName: [String]) -> Fighter {
        //choice the fighter name
        print(Text.getText(key: "fighterName"))
        var fighterName = readLine()!
        
        // we cheak if the name is good
        var isCompleted = false
        var containsAtLeastOneLettreLowercase = false
        var isUnique = false
        let regex = ".*[a-z]+.*" //name at least 1 Lowercase Alphabet
        var choiceType = 1

        while isCompleted == false || containsAtLeastOneLettreLowercase == false || isUnique == false {
            if fighterName == "" {
                isCompleted = false
                while fighterName == "" {
                    print("Please write the name you want to give to the fighter")
                    fighterName = readLine()!
                }
                
                isCompleted = true

            } else {
                isCompleted = true
            }
            
            //name with at least one lowercase letter ?
            containsAtLeastOneLettreLowercase = NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: fighterName)
            if containsAtLeastOneLettreLowercase == false {
                print(Text.getText(key: "leastOneLowercase"))
                fighterName = readLine()!
            } else {
                containsAtLeastOneLettreLowercase = true
            }

            //check if the name is already in use
            if listName == [] {
                isUnique = true
            }
            else {
                for name in listName {
                    if name.lowercased() == fighterName.lowercased() {
                        isUnique = false
                        print(Text.getText(key: "existingName"))
                        fighterName = readLine()!
                        
                    } else {
                        isUnique = true
                    }
                }
            }
        }

        print(Text.getText(key: "createFighter"))
        //choice the type
        print(Text.getText(key: "fighterType"))
        var userChoice = readLine() ?? ""
        
        if  userChoice.elementsEqual("1") || userChoice.elementsEqual("2") || userChoice.elementsEqual("3") {
            choiceType = Int(userChoice)!
        } else {
            var typeOk = false
            while typeOk == false {
                if userChoice == "1" || userChoice == "2" || userChoice == "3" {
                    typeOk = true
                } else {
                    print(Text.getText(key: "fighterType"))
                    userChoice = readLine() ?? ""
                    print("userCHoice = \(userChoice)")
                }
            }
        }

        //creation of the fighter
        var type: Fighter
        switch choiceType {
            case 1:
                type = TheBoxer(name: fighterName)
            case 2:
                type = TheThinBlade(name: fighterName)
            case 3:
                type = TheBully(name: fighterName)
            default:
                type = TheBoxer(name: fighterName)
            }
        
        let fighter = type
        fighter.name = fighterName

        return fighter
    }
}



