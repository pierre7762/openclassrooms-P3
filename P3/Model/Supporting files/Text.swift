//
//  Text.swift
//  P3
//
//  Created by Pierre Lemère on 12/01/2021.
//

import Foundation

class Text {
    var contained: String
    
    init(contained: String) {
        self.contained = contained
    }
    
    //To use this function in main.swift Text.getText()["The key to the desired text "]!
    static func getText(key: String) -> String{
        let textList = [
            //"Key" : "Value"
            "start": "Hello, start game ! \n",
            "createTeam1": "Create the personnal team of player One : \n",
            "createTeam2": "Create the personnal team of player Two: \n",
            "teamName": "What is the name of your team?",
            "createFighter": "Let's create a fighter :",
            "fighterType": "What type of fighter do you want? \n -For a boxer type 1 \n -For a thin blade type 2 \n -For a bully type 3",
            "fighterName": "What is the name of this fighter ?",
            "attack/care": "want to attack (tape 1) or heal (tape 2) ?",
            "surpriseChest": "******** A surprise chest appears, it contains a weapon more or less effective than yours and which will replace it!******** \n******** Do you want to try your luck ? ********",
            "yesNo": "Yes type 1 or No type 2",
            "existingName": "The name already exists, please choose another one"
        
        ]
        
        let requestedText = textList[key]!
        
        return requestedText
    }

}


