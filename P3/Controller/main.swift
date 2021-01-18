//
//  main.swift
//  P3
//
//  Created by Pierre Lemère on 12/01/2021.
//

import Foundation

//MARK: var
var team1: Team
var team2: Team

//MARK: Prepare game
print("\(Text.getText()["start"]!)")

//team one
print(Text.getText()["createTeam1"]!)
team1 = Team.createTeam()

//team two
print(Text.getText()["createTeam2"]!)
team2 = Team.createTeam()


//MARK: Game

Game.fightStart(team1: team1, team2: team2)
