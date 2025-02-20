// ProfileManager.swift
import Foundation

class ProfileManager {
    // Use a Dictionary for O(1) lookup by UserID (String)
    private var activeProfiles: [String: UserProfile] = [:]

    weak var delegate: ProfileUpdateDelegate? // Use weak to avoid retain cycles

    // Use weak self in the closure to avoid retain cycles
    var onProfileUpdate: ((UserProfile) -> Void)?

    init(delegate: ProfileUpdateDelegate?) {
        self.delegate = delegate
    }

    func loadProfile(id: String, completion: @escaping (Result<UserProfile, Error>) -> Void) {
        // Simulate network request (replace with actual network call)
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }

            if let cachedProfile = self.activeProfiles[id] {
                DispatchQueue.main.async {
                    completion(.success(cachedProfile))
                }
                return
            }

            let profile = UserProfile(id: UUID(), username: "user\(id)", bio: "Bio for user \(id)", followers: Int.random(in: 0...1000))
            self.activeProfiles[id] = profile

            let success = true
            if success {
                DispatchQueue.main.async {
                    completion(.success(profile))
                    self.delegate?.profileDidUpdate(profile)
                    self.onProfileUpdate?(profile)
                }
            } else {
                let error = NSError(domain: "ProfileError", code: 404, userInfo: nil)
                DispatchQueue.main.async {
                    completion(.failure(error))
                    self.delegate?.profileLoadingError(error)
                }
            }
        }
    }
    
    deinit {
        print("ProfileManager deinitialized") //for testing memory management
    }
}
