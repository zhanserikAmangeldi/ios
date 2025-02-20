// UserProfileViewController.swift
import UIKit

class UserProfileViewController: UIViewController {
    weak var profileManager: ProfileManager?
    var imageLoader: ImageLoader?

    func setupProfileManager() {
        profileManager?.onProfileUpdate = { [weak self] profile in
            guard let self = self else { return }
            print("Profile updated: \(profile)")
            // Update UI
        }
        profileManager?.delegate = self
    }

    func updateProfile() {
        profileManager?.loadProfile(id: "123") { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let profile):
                print("Profile loaded: \(profile)")
            case .failure(let error):
                print("Error loading profile: \(error)")
            }
        }
    }

    deinit {
        print("UserProfileViewController deinitialized")
    }
}

extension UserProfileViewController: ProfileUpdateDelegate {
    func profileDidUpdate(_ profile: UserProfile) {
        print("Profile did update \(profile)")
    }

    func profileLoadingError(_ error: Error) {
        print("Profile loading erorr \(error)")
    }
}
