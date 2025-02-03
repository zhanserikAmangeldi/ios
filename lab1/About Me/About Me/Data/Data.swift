import Foundation
import SwiftUI


struct Info {
    let image: String
    let name: String
    let shortDescription: String
    let story: [Story]
    let hobbies: [String]
}

struct Story {
    let topic: String
    let body: String
}

struct SimpleImage {
    let id: Int
    let name: String
    let description: String
}

let information = Info(
    image: "Photo",
    name: "Zhanserik Amangeldi",
    shortDescription: "19 y.o. Almaty programmer",
    story: [
        Story(topic: "Background", body: "I am Amangeldi Zhanserik, I was born and spent my childhood in the city of Arys, South Kazakhstan.  Because of my parents' work, we had to move to another city, and I spent my entire boyhood in Atyrau, Western Kazakhstan. I currently live in Almaty."),
        Story(topic: "Education", body: "- National gymnasium No. 13 (Atyrau)\n- Kazakh-British Technical University, School of Information System and Engineering, Information System 2022-2026 (Almaty)"),
        Story(topic: "Hobbies", body: "I like to spend my free time outdoors, also take pictures of my walks in the mountains."),
    ],
    hobbies: ["bicycle", "ticket.fill", "book.fill"]
)

let images = [
    "Image1",
    "Image2",
    "Image3",
]
