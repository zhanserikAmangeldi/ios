// PostView.swift (Class)
import UIKit

class PostView {
    var imageLoader: ImageLoader?

    func setupImageLoader() {
        imageLoader?.delegate = self
        imageLoader?.completionHandler = { image in
            if let image = image {
                print("Image loaded successfully")
                // Update the UI
            } else {
                print("Image loading failed")
            }
        }
    }
    
    deinit {
        print("PostView deinitialized") //for testing memory management
    }
}

extension PostView: ImageLoaderDelegate {
    func imageLoader(_ loader: ImageLoader, didLoad image: UIImage) {
        print("Image loaded for PostView")
        // Display the image
    }

    func imageLoader(_ loader: ImageLoader, didFailWith error: Error) {
        print("Image failed to load for PostView: \(error)")
    }
}
