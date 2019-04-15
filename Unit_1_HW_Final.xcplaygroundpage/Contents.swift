// Treehouse Tech Degree, Unit 1, Assignment 1
// Student: Casey Conway

//------------PART 1---------------

//For each player, create a Dictionary with String keys and the corresponding values from the Soccer Player Info table
/*
 --Key--
 "Name" = Player name
 "Height" = Player height in inches
 "Experienced" is true if they have soccer experience. False if they don't.
 "Guardians" = Player's guardian name(s)
 */

let joeSmith: [String : Any] = ["Name": "Joe Smith", "Height": 42, "Experienced": true, "Guardians": "Jim and Jan Smith"]
let jillTanner: [String : Any] = ["Name": "Jill Tanner", "Height": 36, "Experienced": true, "Guardians": "Clara Tanner"]
let billBon: [String : Any] = ["Name": "Bill Bon", "Height": 43, "Experienced": true, "Guardians": "Sara and Jenny Bon"]
let evaGordon: [String : Any] = ["Name": "Eva Gordon", "Height": 45, "Experienced": false, "Guardians": "Wendy and Mike Gordon"]
let mattGill: [String : Any] = ["Name": "Matt Gill", "Height": 40, "Experienced": false, "Guardians": "Charles and Sylvia Gill"]
let kimmyStein: [String : Any] = ["Name": "Kimmy Stein", "Height": 41, "Experienced": false, "Guardians": "Bill and Hilary Stein"]
let sammyAdams: [String : Any] = ["Name": "Sammy Adams", "Height": 45, "Experienced": false, "Guardians": "Jeff Adams"]
let karlSaygan: [String : Any] = ["Name": "Karl Saygan", "Height": 42, "Experienced": true, "Guardians": "Heather Bledsoe"]
let suzaneGreenberg: [String : Any] = ["Name": "Suzane Greenberg", "Height": 44, "Experienced": true, "Guardians": "Henrietta Dumas"]
let salDali: [String : Any] = ["Name": "Sal Dali", "Height": 41, "Experienced": false, "Guardians": "Gala Dali"]
let joeKavalier: [String : Any] = ["Name": "Joe Kavalier", "Height": 39, "Experienced": false, "Guardians": "Sam and Elaine Kavalier"]
let benFinkelstein: [String : Any] = ["Name": "Ben Finkelstein", "Height": 44, "Experienced": false, "Guardians": "Aaron and Jill Finkelstein"]
let diegoSoto: [String : Any] = ["Name": "Diego Soto", "Height": 41, "Experienced": true, "Guardians": "Robin and Sarika Soto"]
let chloeAlaska: [String : Any] = ["Name": "Chloe Alaska", "Height": 47, "Experienced": false, "Guardians": "David and Jamie Alaska"]
let arnoldWillis: [String : Any] = ["Name": "Arnold Willis", "Height": 43, "Experienced": false, "Guardians": "Claire Willis"]
let phillipHelm: [String : Any] = ["Name": "Phillip Helm", "Height": 44, "Experienced": true, "Guardians": "Thomas Helm and Eva Jones"]
let lesClay: [String : Any] = ["Name": "Les Clay", "Height": 42, "Experienced": true, "Guardians": "Wynonna Brown"]
let herschelKrustofski: [String : Any] = ["Name": "Herschel Krustofski", "Height": 45, "Experienced": true, "Guardians": "Hyman and Rachel Krustofski"]

//Create a single collection 'players' that contains all information for all 18 players.
let players = [joeSmith,jillTanner,billBon,evaGordon,mattGill,kimmyStein,sammyAdams,karlSaygan,suzaneGreenberg,salDali,joeKavalier,benFinkelstein,diegoSoto,chloeAlaska,arnoldWillis,phillipHelm,lesClay,herschelKrustofski]

//Create empty arrays for each of the teams and one way to store all of them
var teamSharks: [[String: Any]] = []
var teamDragons: [[String: Any]] = []
var teamRaptors: [[String: Any]] = []

//------------PART 2---------------
//Sort the players in experienced and inexperienced groups
var experiencedPlayers: [[String: Any]] = []
var inexperiencedPlayers: [[String: Any]] = []

for player in players {
    if player["Experienced"] as! Bool == true {
        experiencedPlayers.append(player)
    } else {
        inexperiencedPlayers.append(player)
    }
}

// Now distribute them:
// This function evenly distributes players from a group into the three teams
// It uses "n" to keep track of the number of players that have been cycled through and the remainder operator to figure out which team to add them to depending on whether it's a factor of three (assign to Raptors), else two (assign to Dragons), else assign to the Sharks.
// If the number of players in either experience group is not divisible by three, the function looks for the team that has the least players and starts adding the players to that team. The very first draw will just end up with starting with Sharks.
func distributePlayers(fromPlayerGroup playerGroup: [[String: Any]]){
    //Deciding what team to start with
    var n: Int = 1
    if (experiencedPlayers.count % 3 != 0 || inexperiencedPlayers.count % 3 != 0) && !(teamRaptors.count == teamDragons.count && teamDragons.count == teamSharks.count) {
        if teamDragons.count < teamSharks.count || teamDragons.count < teamSharks.count {
            n = 2
        } else if teamRaptors.count < teamSharks.count || teamRaptors.count < teamDragons.count {
            n = 3
        }
    }
    //Distributing the players
    for player in playerGroup {
        if n%3 == 0 {
            teamRaptors.append(player)
        } else if n%2 == 0 {
            teamDragons.append(player)
        } else {
            teamSharks.append(player)
        }
        n+=1
    }
}

//Call the distributePlayers function twice in order to distribute of the inexperienced player group and then the experienced player groups across the three teams.
distributePlayers(fromPlayerGroup: experiencedPlayers)
distributePlayers(fromPlayerGroup: inexperiencedPlayers)

//------------PART 3---------------

/* Write code that iterates through all three teams of players and generates a personalized letter to the guardians...
 */

//where the letters are stored:
var letters: [String] = []

//this function generates all the letters for a single team at a time
func generateLetters(forTeam team: [[String:Any]], ofName teamName: String, forPracticeOn practiceDateAndTime: String) {
    for player in team {
        let letter = """
        Dear \(player["Guardians"] as! String),
        
        This year we've taken extra care to make sure the teams are fairly matched by evenly dividing the number of experienced players between the teams. \(player["Name"] as! String) has been placed on... DRUM ROLL PLEASE... the \(teamName)!
        
        The first team practice for the \(teamName) is on \(practiceDateAndTime). Let the games begin!
        
        Best,
        Casey Conway
        League Coordinator
        
        
        """
        letters.append(letter)
    }
}

//generate letters team by team
generateLetters(forTeam: teamSharks, ofName: "Sharks", forPracticeOn: "March 17th at 3pm")
generateLetters(forTeam: teamDragons, ofName: "Dragons", forPracticeOn: "March 17th at 1pm")
generateLetters(forTeam: teamRaptors, ofName: "Raptors", forPracticeOn: "March 18th at 1pm")

//print out all the letters in the console
for letter in letters {
    print(letter)
}
