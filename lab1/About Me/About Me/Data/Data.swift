import Foundation
import SwiftUI


struct Info {
    let image: String
    let name: String
    let shortDescription: String
    let briefBio: String
    let story: [Story]
    let soft_skills: [String]
    let hard_skills: [(String, [String])]
    let randomFacts: [Fact]
}

struct Story {
    let topic: String
    let body: String
}

struct Fact {
    let body: String
    let image: String
}

let information = Info(
    image: "Photo",
    name: "Zhanserik Amangeldi",
    shortDescription: "19 y.o. mountain lover from Almaty",
    briefBio: "\tI am Amangeldi Zhanserik, born in 2005 in Arys, South Kazakhstan. Due to my parents' work, I moved to Atyrau, where I grew up. Currently, I live in Almaty, studying Information Systems at Kazakh-British Technical University. In my free time, I enjoy outdoor activities and capturing mountain landscapes through photography.",
    story: [
        Story(topic: "Background", body: "I am Amangeldi Zhanserik, I was born in 2005 and spent my childhood in the city of Arys, South Kazakhstan.  Because of my parents' work, we had to move to another city, and I spent my entire boyhood in Atyrau, Western Kazakhstan. I currently live in Almaty."),
        Story(topic: "Education", body: "- National gymnasium No. 13 (Atyrau)\n- Kazakh-British Technical University, School of Information System and Engineering, Information System 2022-2026 (Almaty)"),
        Story(topic: "Hobbies", body: "I like to spend my free time outdoors, also take pictures of my walks in the mountains."),
    ],
    soft_skills: [
            "Adaptability",
            "Active listening",
            "Patience",
            "Emotional intelligence",
            "Flexibility",
    ],
    hard_skills: [
        ("Languages", ["Python", "Golang", "PHP", "Swift", "Kotlin"]),
        ("Frameworks", ["Django", "Laravel", "FastAPI", "Jetpack Compose"]),
        ("Databases", ["MySQL", "PostgreSQL", "SQLite"]),
        ("Version Control", ["Git", "GitHub/GitLab"]),
        ("Message Brokers & Caching", ["Redis", "Kafka"]),
        ("DevOps", ["Docker", "GitLab CI/CD", "Terraform", "Nomad", "Crontab", "Linux Services"]),
    ],
    randomFacts: [
        Fact(body: "The first peak I climbed was Kumbel", image: "kumbel"),
        Fact(body: "My favorite anime is Bleach", image: "bleach"),
        Fact(body: "Klaus is the best cartoon in the last 6 years imo", image: "klaus"),
        Fact(body: "DevOps is one of the hardest discipline in KBTU, I am almost die trying to pass it", image: "devops"),
        Fact(body: "I chose to study IOS development randomly", image: "dies"),
    ]
)

let images = [
    "Image1",
    "Image2",
    "Image3",
    "Image4",
    "Image5",
    "Image6",
    "Image7",
    "Image8",
    "Image9",
    "Image10",
    "Image11",
    "Image12",
    "Image13",
    "Image14",
    "Image15",
    "Image16",
]
