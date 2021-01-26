//
//  Text.swift
//  P3
//
//  Created by Pierre Lemère on 12/01/2021.
//

import Foundation

class Text {
    //To use this function in main.swift Text.getText("The key to the desired text ")
    static func getText(key: String) -> String{
        let textList = [
            //"Key" : "Value"
            "start": "Hello, start game ! \n",
            "createTeam1": "Create the personnal team of player One : \n",
            "createTeam2": "\n\n Create the personnal team of player Two: \n",
            "teamName": "\n What is the name of your team?",
            "createFighter": "Let's create a fighter :",
            "fighterType": "What type will your fighter be ? \n -For a boxer type 1 \n -For a thin blade type 2 \n -For a bully type 3",
            "fighterName": "What is the name of this fighter ? ",
            "attack/care": "want to attack (tape 1) or heal (tape 2) ?",
            "surpriseChest": "******** A surprise chest appears, it contains a weapon more or less effective than yours and which will replace it!******** \n******** Do you want to try your luck ? ********",
            "yesNo": "Yes type 1 or No type 2",
            "existingName": "The name already exists, please choose another one",
            "leastOneLowercase": "Write a name with at least one lowercase letter",
            "chooseFromProposals" : "Please choose only from the proposals given !"
        ]
        
        let requestedText = textList[key]!
        
        return requestedText
    }

}


