//
//  ToolsTeam.swift
//  P3
//
//  Created by Pierre Lemère on 27/01/2021.
//

import Foundation

class ToolsTeam {
    func checkIfTeamNameIsOk(teamOneName: String) -> String {
        //choice the team name
        print(Text.getText(key: "teamName"))
        var teamName = readLine()!

        var nameIsNotEmpty = false
        var containsAtLeastOneLettreLowercase = false
        var isNotEqualsToTeamOneName = false
        
        while nameIsNotEmpty == false || containsAtLeastOneLettreLowercase == false || isNotEqualsToTeamOneName == false {
            // check if is not empty
            nameIsNotEmpty = checkTeamNameEmpty(teamName: &teamName)
            // check if the team name contain least one lowercase
            containsAtLeastOneLettreLowercase = checkIfContainLeastOnelowercase(name: &teamName, containsAtLeastOneLettreLowercase: &containsAtLeastOneLettreLowercase)
            // check if teamName is not equal to teamoneName
            isNotEqualsToTeamOneName = checkIfNotEqualsToTeamOneName(teamName: &teamName, teamOneName: teamOneName)
        }
        return teamName
    }
    
    private func checkIfContainLeastOnelowercase(name: inout String, containsAtLeastOneLettreLowercase: inout Bool) -> Bool{
        let regex = ".*[a-z]+.*" //name at least 1 Lowercase Alphabet
        //name with at least one lowercase letter ?
        while containsAtLeastOneLettreLowercase == false {
            containsAtLeastOneLettreLowercase = NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: name)
            if containsAtLeastOneLettreLowercase == false {
                print(Text.getText(key: "leastOneLowercase"))
                name = readLine()!
            }
        }
        return true
    }
    
    private func checkTeamNameEmpty(teamName: inout String) -> Bool {
        var ok = false
        while ok == false {
            if teamName.elementsEqual("") {
                print(Text.getText(key: "teamName"))
                teamName = readLine()!
            } else {
                ok = true
            }
        }
        return ok
    }
    
    private func checkIfNotEqualsToTeamOneName(teamName: inout String,teamOneName: String) -> Bool {
        var ok = false
        
        while ok == false {
            if teamName.lowercased().elementsEqual(teamOneName.lowercased()) {
                print(Text.getText(key: "existingName"))
                teamName = readLine()!
                
                var checkEmpty = false
                var checkLowercaser = false
                var containsAtLeastOneLettreLowercase = false
                
                while checkEmpty == false || checkLowercaser == false {
                    checkEmpty = checkTeamNameEmpty(teamName: &teamName)
                    checkLowercaser = checkIfContainLeastOnelowercase(name: &teamName, containsAtLeastOneLettreLowercase: &containsAtLeastOneLettreLowercase)
                }
            } else {
                ok = true
            }
        }
        return ok
    }
        
}
