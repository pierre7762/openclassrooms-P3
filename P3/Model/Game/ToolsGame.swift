//
//  ToolsGame.swift
//  P3
//
//  Created by Pierre Lemère on 18/01/2021.
//

import Foundation


class ToolsGame {
    var listPlayerName: [String] = []
    
        
    //MARK: actions
    
    func round(attacker: Team, defender: Team){
        let tool = ToolsGame()
        //check if the team is in game
        if attacker.fighterInLife > 0{
            var fighterWhoAttacks: Fighter
            var action: Int
            var attack: Int

            var target: Fighter
            
            // selection of fighters
            fighterWhoAttacks = tool.selectedAttacker(attacker: attacker)
            // what the attacker do ?
            action = tool.actionChoose()
            // attack
            if action == 1 {
                SurpriseChest.surpriseChest(fighter: fighterWhoAttacks)
                target = tool.selectedTarget(target: defender)
                print("     -> \(fighterWhoAttacks.name) attack \(target.name)")
                
                if target.isItToDodge() == false {
                    attack = fighterWhoAttacks.damagePointAttack()
                    print("     -> \(target.name) subit \(attack) damage points")
                    target.life -= attack
                    
                    if target.life > 0 {
                        print("     -> \(target.name) has \(target.life) life points \n")
                    }
                    else {
                        target.isDead = true
                        defender.fighterInLife -= 1
                        print("\n\(target.name) is dead \n")
                    }
                }
                else {
                    print("     -> \(target.name) dodged the attack \n")
                }
            }
            // heal
            if action == 2{
                target = tool.healTarget(target: attacker)
                print("\(fighterWhoAttacks.name) treats \(target.name) \n")
            }

        }
 
    }
    
    
    func checkName(_ name: String, listName: [String]) -> Bool{
        var list = listName
        var isItExisting = false
        
        for existingName in list {
            if name == existingName {
                isItExisting = true
            } else {
                list.append(name)
                isItExisting = false
            }
        }
        return isItExisting
    }
    
    
    func selectedAttacker(attacker:Team) -> Fighter{
       var attackerChooses: Int
       var fighterWhoAttacks = attacker.fightersList[0]
           
       print("Team : \(attacker.teamName), which fighter do you want to use ?")
       //check if fighters are in life
       for i in 0 ..< attacker.fightersList.count {
           if attacker.fightersList[i].isDead == false {
               print("tape \(i + 1) : \(attacker.fightersList[i].name) (\(attacker.fightersList[i].typeName)): \(attacker.fightersList[i].life)/\(attacker.fightersList[i].lifeMax) life points | weapon : \(attacker.fightersList[i].weaponPower) | max damage : \(attacker.fightersList[i].maxAttackPotentielCal()) pts | critical hit % : \(attacker.fightersList[i].criticalHitPercentage) %")
           }
       }
       attackerChooses = Int(String(readLine()!))!
       // take the attacker with index
       fighterWhoAttacks = attacker.fightersList[attackerChooses - 1]
         
       return fighterWhoAttacks
   }

    
    
    func actionChoose() -> Int{
        var actionChoose: Int
        print("\(Text.getText(key: "attack/care"))")
        actionChoose = Int(String(readLine()!))!

        return actionChoose
    }
    
    func selectedTarget(target:Team) -> Fighter{
        var targetChooses: Int
        var targetAttacked = target.fightersList[0]
         
        print("Which enemy do you want to attack ?")
        
        //check if targets are in life
        for i in 0 ..< target.fightersList.count {
            if target.fightersList[i].isDead == false{
                print("tape \(i + 1) : \(target.fightersList[i].name) (\(target.fightersList[i].typeName)) : \(target.fightersList[i].life)/\(target.fightersList[i].lifeMax) life points | dodge % : \(target.fightersList[i].dodge) % ")
            }
        }
        
        //select the target
        targetChooses = Int(String(readLine()!))!
        // take the target with index
        targetAttacked = target.fightersList[targetChooses - 1]
       
        return targetAttacked
    }
    
    func healTarget(target: Team) -> Fighter{
        var targetChooses: Int
        var targetHeal = target.fightersList[0]
         
        print("Which teammate do you want to heal?")
        
        //check if targets are in life
        for i in 0 ..< target.fightersList.count {
            if target.fightersList[i].isDead == false{
                print("tape \(i + 1) : \(target.fightersList[i].name) (\(target.fightersList[i].typeName)) : \(target.fightersList[i].life)/\(target.fightersList[i].lifeMax) life points")
            }
        }
        
        //select the target
        targetChooses = Int(String(readLine()!))!
        // take the target with index
        targetHeal = target.fightersList[targetChooses - 1]
      
        return targetHeal
    }
    
   

}
