import Foundation

struct ServerResponse: Codable {
    let response_code: Int
    let results: [Results]
}

struct Results: Codable {
    let question: String?
    let correct_answer: String?
    let incorrect_answers: [String?]
    let difficulty: String?
    let category: String?
    let type: String?
}
