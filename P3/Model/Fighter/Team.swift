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
    
    static func createTeam(listFightersTeam: [Fighter]) -> Team{
       
        //choice the team name
        print(Text.getText(key: "teamName"))
        var teamName = readLine()!
        if teamName == ""{
            //while the user don't write a word the question loop
            while teamName == "" {
                print(Text.getText(key: "teamName"))
                teamName = readLine()!
            }
        }

        let team = Team(teamName: teamName, fightersList: listFightersTeam )
        
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
 
