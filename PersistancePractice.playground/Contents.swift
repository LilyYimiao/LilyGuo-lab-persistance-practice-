import Cocoa
var str = "Hello, playground"



struct Note: Codable {
    let title: String
    let text: String
    let timeStamp: Date
}

let newNote = Note(title: "Grocery run", text: "pick up ....", timeStamp: Date())
let note1 = Note(title: "note one", text: "11111111111", timeStamp: Date())
let note2 = Note(title: "note two", text: "22222222222", timeStamp: Date())
let note3 = Note(title: "note three", text: "3333333333", timeStamp: Date())
let notes = [note1, note2, note3]

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(notes)
try? encodedNote?.write(to: archiveURL)
let propertyListDecoder = PropertyListDecoder()
if let retrievedNotesData = try? Data(contentsOf: archiveURL), let decodedNotes = try? propertyListDecoder.decode(Array<Note>.self, from: retrievedNotesData) {
    print(decodedNotes)
}
