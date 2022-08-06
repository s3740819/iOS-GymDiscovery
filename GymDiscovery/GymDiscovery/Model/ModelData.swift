/*
    RMIT University Vietnam
    Course: COSC2659 iOS Development
    Semester: 2022B
    Assessment: Assignment 1
    Author: Tran Kim Bao
    ID: s3740819
    Created Date: 01/08/2022
    Last Modified: 05/08/2022
    Acknowledgement:
        - Google Map: For Coordinate Checking
        - https://saigonkisstours.com/recommended-gyms-in-ho-chi-minh/
 */

import Foundation

// gymList generator by reading json file
var gymList = readJsonFile(jsonFileName: "list.json")

// Extract data from json file
func readJsonFile(jsonFileName: String) -> [Gym] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        if let content = try? Data(contentsOf: file) {
            do {
                return try JSONDecoder().decode([Gym].self, from: content)
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [Gym]
}
