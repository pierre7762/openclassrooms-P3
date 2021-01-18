//
//  Fight.swift
//  P3
//
//  Created by Pierre Lemère on 13/01/2021.
//

import Foundation


class Game{
    
    //MARK: Game
    
    static func fightStart(team1: Team, team2: Team){
        var roundNumber = 0
        
        
        while team1.fighterInLife > 0 && team2.fighterInLife > 0 {
            roundNumber += 1
            // team one start
            print("<<<<<<<<<<<<<< ROUND \(roundNumber) : >>>>>>>>>>>>>>>>\n")
            if team1.fighterInLife > 0 {
                round(attacker: team1, defender: team2)
            }
            if team2.fighterInLife > 0 {
                round(attacker: team2, defender: team1)
            }
        }
 
        // end of game
        if team1.fighterInLife == 0 && team2.fighterInLife > 0{
            print("///////////////////////////////////////////////////")
            print("     \(team2.teamName) WIN in \(roundNumber) Rounds ! ")
            print("///////////////////////////////////////////////////")
        }
        if team2.fighterInLife == 0 && team1.fighterInLife > 0 {
            print("///////////////////////////////////////////////////")
            print("     \(team1.teamName) WIN in \(roundNumber) Rounds ! ")
            print("///////////////////////////////////////////////////")
        }
        
//        detail
        team1.finalDetail()
        team2.finalDetail()
        
    }
    
    static func round(attacker: Team, defender: Team){
        //check if the team is in game
        if attacker.fighterInLife > 0{
            var fighterWhoAttacks: Fighter
            var action: Int
            var attack: Int

            var target: Fighter
            
            // selection of fighters
            fighterWhoAttacks = selectedAttacker(attacker: attacker)
            // what the attacker do ?
            action = actionChoose()
            // attack
            if action == 1 {
                SurpriseChest.surpriseChest(fighter: fighterWhoAttacks)
                target = selectedTarget(target: defender)
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
                target = healTarget(target: attacker)
                print("\(fighterWhoAttacks.name) treats \(target.name) \n")
            }

        }
 
    }
    
    //MARK: actions
    static func selectedAttacker(attacker:Team) -> Fighter{
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

    
    
    static func actionChoose() -> Int{
        var actionChoose: Int
        print("\(Text.getText()["attack/care"]!)")
        actionChoose = Int(String(readLine()!))!

        return actionChoose
    }
    
    static func selectedTarget(target:Team) -> Fighter{
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
    
    static func healTarget(target: Team) -> Fighter{
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
