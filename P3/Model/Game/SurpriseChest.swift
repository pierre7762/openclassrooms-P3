//
//  SurpriseChest.swift
//  P3
//
//  Created by Pierre Lemère on 15/01/2021.
//

import Foundation

class SurpriseChest {
    static func getRandomSurpriseChest(fighter: Fighter) {
        let rand = Int.random(in: 1..<100)
        let toolGame = ToolsGame()
        
        // 30% appearances
        if rand > 0 && rand <= 50 {
            print("\(Text.getText(key: "surpriseChest"))")
            print("\(Text.getText(key: "yesNo"))")
            let answer = toolGame.getInputStringToInt(expectedChoice: ["1","2"])
             
            if answer == 1 {
                let alea = Int.random(in: 1..<100)
                
                // no chance
                if alea > 0 && alea <= 20 {
                    fighter.weaponPower = .low
                    print("******* 😢 No chance, your fighter now has the least powerful weapon ********")
                    print("your weapon : \(fighter.weaponPower) | \(fighter.getMaxAttackPotentiel()) \n")
                }
                // normal
                else if alea > 20 && alea <= 60 {
                    fighter.weaponPower = .normal
                    print("******* 😅 your fighter now has the normal powerful weapon ********")
                    print("your weapon : \(fighter.weaponPower) | \(fighter.getMaxAttackPotentiel()) \n")
                }
                // you are lucky !
                else {
                    fighter.weaponPower = .powerfull
                    print("******* 😄 your fighter now has the most powerful weapon ********")
                    print("your weapon : \(fighter.weaponPower) | \(fighter.getMaxAttackPotentiel()) \n")
                }
            }
        }
    }
}
