//
//  Fight.swift
//  P3
//
//  Created by Pierre Lemère on 13/01/2021.
//

import Foundation

class Fight{
    
    
    static func game(team1: Team, team2: Team){
        var roundNumber = 0
        
        while team1.fighterInLife > 0 || team2.fighterInLife > 0 {
            roundNumber += 1
            // équipe une commence
            print("ROUND \(roundNumber) : \n")
            
            
            
        }
    }
    
    private func round(attacker: Team, defender: Team){
        var fighterWhoAttacks: Fighter
        var targetedEnemyFighter: Fighter
        
        // selection of fighters
        fighterWhoAttacks = selectedAttacker(attacker: attacker)
        targetedEnemyFighter = selectedTaget(target: defender)
        print("\(fighterWhoAttacks) attack \(targetedEnemyFighter) \n")
        
    
        
    }
    
    private func selectedAttacker(attacker:Team) -> Fighter{
        var attackerChooses: String
        var fighterWhoAttacks = attacker.fighterOne
        
        
        print("Team : \(attacker.teamName), which fighter do you want to use ?")
        print("\(attacker.fighterOne.name) tape 1 \n \(attacker.fighterTwo.name) tape 2 \n \(attacker.fighterTree.name) tape 3")
        attackerChooses = readLine()!
        while attackerChooses != "1" || attackerChooses != "2" || attackerChooses != "3" {
            print("\(attacker.fighterOne.name) tape 1 \n \(attacker.fighterTwo.name) tape 2 \n \(attacker.fighterTree.name) tape 3")
            attackerChooses = readLine()!
        }
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
    
    private func selectedTaget(target:Team) -> Fighter{
        var tagetChooses: String
        var targetAttacked = target.fighterOne
        
        
        print("which enemy do you want to attack ?")
        print("\(target.fighterOne.name) tape 1 \n \(target.fighterTwo.name) tape 2 \n \(target.fighterTree.name) tape 3")
        tagetChooses = readLine()!
        while tagetChooses != "1" || tagetChooses != "2" || tagetChooses != "3" {
            print("\(target.fighterOne.name) tape 1 \n \(target.fighterTwo.name) tape 2 \n \(target.fighterTree.name) tape 3")
            tagetChooses = readLine()!
        }
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
    
    
}
