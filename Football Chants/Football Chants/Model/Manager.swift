import Foundation

enum JobType: String {
    case manager
    case headCoach
}

struct Manager {
    let name: String
    let job: JobType
}
