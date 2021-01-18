//
//  CreateTeam.swift
//  P3
//
//  Created by Pierre Lemère on 12/01/2021.
//

import Foundation

class Team{
    var teamName: String
    var fightersList: [Fighter]
    var fighterInLife = 3
    
    //choice the team name and your fighters types. Warning : don't forget to give name for all fighters
    init(teamName: String, fightersList: [Fighter]) {
        self.teamName = teamName
        self.fightersList = fightersList

    }
    
    static func createTeam() -> Team{
        var list: [Fighter] = []
        //choice the team name
        print(Text.getText()["teamName"]!)
        var teamName = readLine()!
        if teamName == ""{
            //while the user don't write a word the question loop
            while teamName == "" {
                print(Text.getText()["teamName"]!)
                teamName = readLine()!
            }
        }
        for _ in 1 ..< 4 {
            let fighter = Fighter.createFighterChoice()
            list.append(fighter)
        }
        let team = Team(teamName: teamName, fightersList: list )
        
        return team
    }
    
    func finalDetail(){
        for i in 0 ..< self.fightersList.count {
            var lifeOrDead = ""
            if self.fightersList[i].isDead == true {
                lifeOrDead = "Dead"
            } else {
                lifeOrDead = "Alive"
            }
            
            print("\(lifeOrDead) - \(self.fightersList[i].name) (\(self.fightersList[i].typeName)): \(self.fightersList[i].life)/\(self.fightersList[i].lifeMax) life points | weapon : \(self.fightersList[i].weaponPower) | max damage : \(self.fightersList[i].maxAttackPotentielCal()) pts | critical hit % : \(self.fightersList[i].criticalHitPercentage) %")
        }
    }
    
}
 
