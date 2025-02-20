// ImageLoader.swift
import UIKit

class ImageLoader {
    var delegate: ImageLoaderDelegate?

    var completionHandler: ((UIImage?) -> Void)?

    func loadImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.delegate?.imageLoader(self, didLoad: image)
                    self.completionHandler?(image)
                }
            } else {
                let error = NSError(domain: "ImageError", code: 400, userInfo: nil)
                DispatchQueue.main.async {
                    self.delegate?.imageLoader(self, didFailWith: error)
                    self.completionHandler?(nil)
                }
            }
        }
    }
    
    deinit {
        print("ImageLoader deinitialized") //for testing memory management
    }
}
