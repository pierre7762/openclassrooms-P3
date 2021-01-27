//
//  CreateTeam.swift
//  P3
//
//  Created by Pierre Lemère on 12/01/2021.
//

import Foundation

class Team {
    var teamName: String
    var fightersList: [Fighter]
    
    //choice the team name and your fighters types. Warning : don't forget to give name for all fighters
    init(teamName: String, fightersList: [Fighter]) {
        self.teamName = teamName
        self.fightersList = fightersList
    }
    
    static func createTeam(listFightersTeam: [Fighter], team1Name: String?) -> Team {
        let toolsTeam = ToolsTeam()
        var teamOneName: String
        if team1Name == nil {
            teamOneName = "."
        } else {
            teamOneName = team1Name ?? "."
        }
        // check if teamName is ok
        let teamName = toolsTeam.checkIfTeamNameIsOk(teamOneName: teamOneName)
       
        let team = Team(teamName: teamName, fightersList: listFightersTeam)
        
        return team
    }
    
    func printFinalDetailsFighters() {
        for i in 0 ..< self.fightersList.count {
            var lifeOrDead = ""
            if self.fightersList[i].isDead == true {
                lifeOrDead = "Dead"
            } else {
                lifeOrDead = "Alive"
            }
            
            print("\(lifeOrDead) - \(self.fightersList[i].name) (\(self.fightersList[i].typeName)): \(self.fightersList[i].life)/\(self.fightersList[i].lifeMax) life points | weapon : \(self.fightersList[i].weaponPower) | max damage : \(self.fightersList[i].getMaxAttackPotentiel()) pts | critical hit % : \(self.fightersList[i].criticalHitPercentage) %")
        }
    }
    
}

