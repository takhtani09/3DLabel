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
    var originalFont: UIFont?

    // MARK: - Shadow Update

    func updateShadow() {
        layer.shadowColor = customShadowColor.cgColor
        layer.shadowOffset = customShadowOffset
        layer.shadowRadius = customShadowRadius
        layer.shadowOpacity = 1.0 // You can adjust this value as needed
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        updateShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        updateShadow()
    }

    // MARK: - Custom 3D Fonts

    @IBInspectable var is3DFont: Bool = false {
        didSet {
            if is3DFont {
                // Set the font to "NexaRustSlab-BlackShadow01.otf" when is3DFont is true
                if let font = UIFont(name: "NexaRustSlab-BlackShadow01", size: font.pointSize) {
                    setFontWith3D(font: font)
                } else {
                    // Fallback to a default font in case the selected 3D font cannot be loaded
                    setFontWith3D(font: UIFont.systemFont(ofSize: font.pointSize))
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

    func setFontWith3D(font: UIFont) {
        self.font = font
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        // Store the original font set in the storyboard
        originalFont = font
    }
}
