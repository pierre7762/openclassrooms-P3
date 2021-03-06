//
//  ToolsGame.swift
//  P3
//
//  Created by Pierre Lemère on 18/01/2021.
//

import Foundation

class ToolsGame {
    var listPlayerName: [String] = []
    
    func prepareGame(listName: inout [String]) -> [Team]   {
        var team1: Team
        var team2: Team
        //        team one
        print(Text.getText(key: "createTeam1"))
        let listTeam1 = updateFighterListNameControlled(listName: listName)
        for f in listTeam1 {
            listName.append(f.name)
        }
        team1 = Team.createTeam(listFightersTeam: listTeam1, team1Name: nil)

        //team two
        print(Text.getText(key: "createTeam2"))
        let listTeam2 = updateFighterListNameControlled(listName: listName)
        for f in listTeam1 {
            listName.append(f.name)
        }
        team2 = Team.createTeam(listFightersTeam: listTeam2, team1Name: team1.teamName)
        
        let listTeam = [team1, team2]
        
        return listTeam
    }
    
    private func updateFighterListNameControlled(listName: [String]) -> [Fighter] {
        // we check if the name that the user wants to give it is not already assigned
        var listName = listName
        var listFightersTeam: [Fighter] = []
        
        for _ in 1 ..< 4 {
            let fighter = Fighter.createFighterChoice(listName: listName)
            listName.append(fighter.name)
            print(listName)
 
            listFightersTeam.append(fighter)
        }
        
        return listFightersTeam
    }
    
    //MARK: actions game
    func startRound(attacker: Team, defender: Team) {
        let tool = ToolsGame()
        //check if the team is in game
        if attacker.fightersList.count > 0 {
            var fighterWhoAttacks: Fighter
            var action: Int
            var target: Fighter
            
            // selection of fighters
            fighterWhoAttacks = tool.selectedAttacker(attacker: attacker)
            // what the attacker do ?
            action = tool.chooseAction()
            // attack
            if action == 1 {
                attacked(fighterWhoAttacks: fighterWhoAttacks, defender: defender)
            }
            // heal
            if action == 2 {
                target = tool.healTarget(target: attacker)
                print("\(fighterWhoAttacks.name) treats \(target.name)\n")
                heal(targetHeal: target)
            }
        }
    }
    
    private func checkName(_ name: String, listName: [String]) -> Bool {
        var list = listName
        var isItExisting = false
        
        for existingName in list {
            if name.lowercased() == existingName.lowercased() {
                isItExisting = true
            } else {
                list.append(name)
                isItExisting = false
            }
        }
        
        return isItExisting
    }
    
    private func selectedAttacker(attacker:Team) -> Fighter {
        var attackerChooses: Int
        let listAttackerInLife = self.getAttackerInLife(attacker: attacker)
        var fighterWhoAttacks = attacker.fightersList[0]
           
       print("Team : \(attacker.teamName), which fighter do you want to use ?")
       //check if fighters are in life
       attackerChooses = self.getInputStringToInt(expectedChoice: listAttackerInLife)
        var ok = false
        
        while ok == false {
            if attacker.fightersList[attackerChooses - 1].isDead == false {
                ok = true
            } else {
                print(Text.getText(key: "proposedPlayer"))
                attackerChooses = self.getInputStringToInt(expectedChoice: listAttackerInLife)
            }
        }
       // take the attacker with index
       fighterWhoAttacks = attacker.fightersList[attackerChooses - 1]
         
       return fighterWhoAttacks
   }

    private func chooseAction() -> Int {
        var actionChoose: Int
        print("\(Text.getText(key: "attack/care"))")
        actionChoose = self.getInputStringToInt(expectedChoice: ["1","2"])

        return actionChoose
    }
    
    private func attacked(fighterWhoAttacks: Fighter, defender: Team) {
        let tool = ToolsGame()
        let attack: Int
        SurpriseChest.getRandomSurpriseChest(fighter: fighterWhoAttacks)
        let target = tool.selectedTarget(target: defender)
        print("     -> \(fighterWhoAttacks.name) attack \(target.name)")
        
        if target.isItToDodge() == false {
            attack = fighterWhoAttacks.getDamagePointAttack()
            print("     -> \(target.name) subit \(attack) damage points")
            target.life -= attack
            
            if target.life > 0 {
                print("     -> \(target.name) has \(target.life) life points \n")
            }
            else {
                target.isDead = true
                target.life = 0
                print("\n\(target.name) is dead \n")
            }
        }
        else {
            print("     -> \(target.name) dodged the attack \n")
        }
    }
    
    private func selectedTarget(target:Team) -> Fighter {
        var targetChooses: Int
        var listTargetInLife = [""]
        var targetAttacked = target.fightersList[0]
        print("Which enemy do you want to attack ?")
        //check if targets are in life
        for i in 0 ..< target.fightersList.count {
            if target.fightersList[i].isDead == false {
                print("tape \(i + 1) : \(target.fightersList[i].name) (\(target.fightersList[i].typeName)) : \(target.fightersList[i].life)/\(target.fightersList[i].lifeMax) life points | dodge % : \(target.fightersList[i].dodge) % ")
                listTargetInLife.append("\(i + 1)")
            }
        }
        //select the target
        targetChooses = self.getInputStringToInt(expectedChoice: listTargetInLife)
        // take the target with index
        targetAttacked = target.fightersList[targetChooses - 1]
       
        return targetAttacked
    }
    
    private func healTarget(target: Team) -> Fighter {
        var targetChooses: Int
        var listTargetInLife = [""]
        var targetHeal = target.fightersList[0]
         
        print("Which teammate do you want to heal?")
        
        //check if targets are in life
        for i in 0 ..< target.fightersList.count {
            if target.fightersList[i].isDead == false {
                print("tape \(i + 1) : \(target.fightersList[i].name) (\(target.fightersList[i].typeName)) : \(target.fightersList[i].life)/\(target.fightersList[i].lifeMax) life points")
                listTargetInLife.append("\(i + 1)")
            }
        }
        //select the target
        targetChooses = self.getInputStringToInt(expectedChoice: listTargetInLife)
        // take the target with index
        targetHeal = target.fightersList[targetChooses - 1]
      
        return targetHeal
    }
    
    private func heal(targetHeal: Fighter){
        let targetMaxLife = targetHeal.lifeMax
        let lifePointGiven = Int(Double(targetMaxLife) * 0.2) // max 20% of targetMaxLife
        
        if (targetHeal.life + lifePointGiven) >= targetMaxLife {
            targetHeal.life = targetMaxLife
            print("\(targetHeal.name) he recovers all his life points (\(targetHeal.life)/\(targetHeal.lifeMax)")
        } else {
            targetHeal.life += lifePointGiven
            print("\(targetHeal.name) recovers \(lifePointGiven) life points (\(targetHeal.life)/\(targetHeal.lifeMax))")
        }
        

    }
    
    private func getAttackerInLife(attacker: Team) -> [String]{
        var listAttackerInLife = [""]
        for i in 0 ..< attacker.fightersList.count {
            if attacker.fightersList[i].isDead == false {
             print("tape \(i + 1) : \(attacker.fightersList[i].name) (\(attacker.fightersList[i].typeName)): \(attacker.fightersList[i].life)/\(attacker.fightersList[i].lifeMax) life points | weapon : \(attacker.fightersList[i].weaponPower) | max damage : \(attacker.fightersList[i].getMaxAttackPotentiel()) pts | critical hit % : \(attacker.fightersList[i].criticalHitPercentage) %")
                listAttackerInLife.append("\(i + 1)")
            }
        }
        return listAttackerInLife
    }
    
    func knowIfStillFightersAlive(team: Team) -> Bool{
        var numberFighterInLife = 0
        for i in 0 ... team.fightersList.count - 1 {
            let fighter = team.fightersList[i]
            if fighter.isDead == false {
                numberFighterInLife += 1
            }
        }
        
        if numberFighterInLife == 0 {
            return false
        } else {
            return true
        }
    }
    
    func getInputStringToInt(expectedChoice: [String]) -> Int {
        var inputString = readLine() ?? ""
        var inputInt = 0
        let expectedChoiceSize = expectedChoice.count
        var ok = false
        
        while ok == false && inputInt == 0 {
            if inputString == ""{
                
            } else {
                for i in 0 ..< expectedChoiceSize {
                    let expected: String = expectedChoice[i]
                    if inputString.elementsEqual(expected) {
                        ok = true
                        inputInt = Int(expected) ?? 0
                        break
                    }
                }
            }
            if ok == false {
                print(Text.getText(key: "chooseFromProposals"))
                inputString = readLine() ?? ""
            }
        }
        return inputInt
    }
    
}
