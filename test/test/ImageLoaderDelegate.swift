// ImageLoaderDelegate.swift
import Foundation
import UIKit // Needed for UIImage

protocol ImageLoaderDelegate {
    func imageLoader(_ loader: ImageLoader, didLoad image: UIImage)
    func imageLoader(_ loader: ImageLoader, didFailWith error: Error)
}
