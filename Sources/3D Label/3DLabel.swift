//
//  3DLabel.swift
//  Musik App
//
//  Created by IPS-108 on 21/08/23.
//

import UIKit


@IBDesignable
class ThreeDLabel: UILabel {

    // MARK: - Inspectable Properties

    @IBInspectable var customShadowColor: UIColor = UIColor.clear {
        didSet {
            updateShadow()
        }
    }

    @IBInspectable var customShadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            updateShadow()
        }
    }

    @IBInspectable var customShadowRadius: CGFloat = 0 {
        didSet {
            updateShadow()
        }
    }

    // Store the original font set in the storyboard
    private var originalFont: UIFont?

    // MARK: - Shadow Update

    private func updateShadow() {
        layer.shadowColor = customShadowColor.cgColor
        layer.shadowOffset = customShadowOffset
        layer.shadowRadius = customShadowRadius
        layer.shadowOpacity = 1.0 // You can adjust this value as needed
    }

    // MARK: - Custom 3D Fonts

    @IBInspectable var is3DFont: Bool = false {
        didSet {
            if is3DFont {
                // Set the font to "NexaRustSlab-BlackShadow01.otf" when is3DFont is true
                if let fontURL = Bundle.main.url(forResource: "NexaRustSlab-BlackShadow01", withExtension: "otf") {
                    if let fontDataProvider = CGDataProvider(url: fontURL as CFURL) {
                        if let font = CGFont(fontDataProvider) {
                            setFontWith3D(fontName: "\(font)")
                        }
                    }
                }
                
                
            } else {
                // Use the original font if it's available, otherwise, use the default system font
                if let originalFont = originalFont {
                    font = originalFont
                } else {
                    font = UIFont.systemFont(ofSize: font.pointSize)
                }
            }
        }
    }

    private func setFontWith3D(fontName: String) {
        if let customFont = UIFont(name: fontName, size: font.pointSize) {
            font = customFont
        } else {
            // Fallback to a default font in case the selected 3D font cannot be loaded
            font = UIFont.systemFont(ofSize: font.pointSize)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        // Store the original font set in the storyboard
        originalFont = font
    }
}
