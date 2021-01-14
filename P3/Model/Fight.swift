//
//  Fight.swift
//  P3
//
//  Created by Pierre Lemère on 13/01/2021.
//

import Foundation


class Fight{
    
    //MARK: Game
    
    static func game(team1: Team, team2: Team){
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
            print("/////////////////////////////////")
            print("     \(team2.teamName) WIN ! ")
            print("/////////////////////////////////")
        }
        if team2.fighterInLife == 0 && team1.fighterInLife > 0 {
            print("/////////////////////////////////")
            print("     \(team1.teamName) WIN ! ")
            print("/////////////////////////////////")
        }
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
                surpriseChest(fighter: fighterWhoAttacks)
                target = selectedTarget(target: defender)
                print("     -> \(fighterWhoAttacks.name) attack \(target.name)")
                
                if target.isItToDodge() == false {
                    attack = fighterWhoAttacks.damagePointAttack()
                    print("     -> \(target.name) subit \(attack) damage points")
                    target.life -= attack
                    
                    if target.life > 0 {
                        print("     -> \(target.name) has \(target.life) life points \n")
                    } else {
                        target.isDead = true
                        defender.fighterInLife -= 1
                        print("\n\(target.name) is dead \n")
                    }
                } else {
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
        var attackerChooses: String
        var fighterWhoAttacks = attacker.fighterOne
            
        print("Team : \(attacker.teamName), which fighter do you want to use ?")
        //check if fighters are in life
        if attacker.fighterOne.isDead == false{
            print("tape 1 : \(attacker.fighterOne.name) (\(attacker.fighterOne.typeName)): \(attacker.fighterOne.life)/\(attacker.fighterOne.lifeMax) life points | weapon : \(attacker.fighterOne.weaponPower) | max damage : \(attacker.fighterOne.maxAttackPotentielCal()) pts | critical hit % : \(attacker.fighterOne.criticalHitPercentage) %")
        }
        if attacker.fighterTwo.isDead == false{
            print("tape 2 : \(attacker.fighterTwo.name) (\(attacker.fighterTwo.typeName)): \(attacker.fighterTwo.life)/\(attacker.fighterTwo.lifeMax) life points | weapon : \(attacker.fighterTwo.weaponPower) | max damage : \(attacker.fighterTwo.maxAttackPotentielCal()) pts | critical hit % : \(attacker.fighterTwo.criticalHitPercentage) %")
        }
        if attacker.fighterTree.isDead == false {
            print("tape 3 : \(attacker.fighterTree.name) (\(attacker.fighterTree.typeName)): \(attacker.fighterTree.life)/\(attacker.fighterTree.lifeMax) life points | weapon : \(attacker.fighterTree.weaponPower) | max damage : \(attacker.fighterTree.maxAttackPotentielCal()) pts | critical hit % : \(attacker.fighterTree.criticalHitPercentage) %")
        }
        
        attackerChooses = readLine()!

        
        if attackerChooses == "1" {
            fighterWhoAttacks = attacker.fighterOne
        }
        if attackerChooses == "2" {
            fighterWhoAttacks = attacker.fighterTwo
        }
        if attackerChooses == "3" {
            fighterWhoAttacks = attacker.fighterTree
        }
          
        return fighterWhoAttacks
    }
    
    
    static func actionChoose() -> Int{
        var actionChoose: Int
        print("\(Text.getText()["attack/care"]!)")
        actionChoose = Int(String(readLine()!))!

        return actionChoose
    }
    
    static func selectedTarget(target:Team) -> Fighter{
        var tagetChooses: String
        var targetAttacked = target.fighterOne
         
        print("Which enemy do you want to attack ?")
        
        //check if targets are in life
        if target.fighterOne.isDead == false{
            print("tape 1 : \(target.fighterOne.name) (\(target.fighterOne.typeName)) : \(target.fighterOne.life)/\(target.fighterOne.lifeMax) life points | dodge % : \(target.fighterOne.dodge) % ")
        }
        if target.fighterTwo.isDead == false{
            print("tape 2 : \(target.fighterTwo.name) (\(target.fighterTwo.typeName)) : \(target.fighterTwo.life)/\(target.fighterTwo.lifeMax) life points | dodge % : \(target.fighterTwo.dodge) % ")
        }
        if target.fighterTree.isDead == false {
            print("tape 3 : \(target.fighterTree.name) (\(target.fighterTree.typeName)) : \(target.fighterTree.life)/\(target.fighterTree.lifeMax) life points | dodge % : \(target.fighterTree.dodge) % ")
        }
        
        //select the target
        tagetChooses = readLine()!
        if tagetChooses == "1" {
            targetAttacked = target.fighterOne
        }
        if tagetChooses == "2" {
            targetAttacked = target.fighterTwo
        }
        if tagetChooses == "3" {
            targetAttacked = target.fighterTree
        }
        
        return targetAttacked
    }
    

    static func healTarget(target: Team) -> Fighter{
        var tagetChooses: String
        var targetHeal = target.fighterOne
         
        print("Which teammate do you want to heal?")
        
        //check if targets are in life
        if target.fighterOne.isDead == false{
            print("tape 1 : \(target.fighterOne.name) (\(target.fighterOne.typeName)) : \(target.fighterOne.life)/\(target.fighterOne.lifeMax) life points")
        }
        if target.fighterTwo.isDead == false{
            print("tape 2 : \(target.fighterTwo.name) (\(target.fighterTwo.typeName)) : \(target.fighterTwo.life)/\(target.fighterTwo.lifeMax) life points)")
        }
        if target.fighterTree.isDead == false {
            print("tape 3 : \(target.fighterTree.name) (\(target.fighterTree.typeName)) : \(target.fighterTree.life)/\(target.fighterTree.lifeMax) life points)")
        }
        
        //select the target
        tagetChooses = readLine()!
        if tagetChooses == "1" {
            targetHeal = target.fighterOne
        }
        if tagetChooses == "2" {
            targetHeal = target.fighterTwo
        }
        if tagetChooses == "3" {
            targetHeal = target.fighterTree
        }
        
        return targetHeal
    }
    
    static func surpriseChest(fighter: Fighter){
        let rand = Int.random(in: 1..<100)
        
        // 30% appearances
        if rand > 0 && rand <= 30 {
            
            print("\(Text.getText()["surpriseChest"]!)")
            print("\(Text.getText()["yesNo"]!)")
            let answer = Int(String(readLine()!))
            
            
            if answer == 1 {
                let alea = Int.random(in: 1..<100)
                
                // no chance
                if alea > 0 && alea <= 20{
                    fighter.weaponPower = .low
                    print("******* 😢 No chance, your fighter now has the least powerful weapon ********")
                    print("your weapon : \(fighter.weaponPower) | \(fighter.maxAttackPotentielCal()) \n")
                }
                // normal
                else if alea > 20 && alea <= 70{
                    fighter.weaponPower = .normal
                    print("******* 😅 your fighter now has the normal powerful weapon ********")
                    print("your weapon : \(fighter.weaponPower) | \(fighter.maxAttackPotentielCal()) \n")
                }
                // you are luchy !
                else {
                    fighter.weaponPower = .powerfull
                    print("******* 😄 your fighter now has the most powerful weapon ********")
                    print("your weapon : \(fighter.weaponPower) | \(fighter.maxAttackPotentielCal()) \n")
                    
                }
            }
        }
    }
    
    
}
