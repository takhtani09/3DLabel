    import XCTest
    @testable import _D_Label

    class ThreeDLabelTests: XCTestCase {

        func testShadowColorChange() {
            let label = ThreeDLabel()
            label.customShadowColor = .red

            XCTAssertEqual(label.layer.shadowColor, UIColor.red.cgColor)
        }

        func testShadowOffsetChange() {
            let label = ThreeDLabel()
            label.customShadowOffset = CGSize(width: 2, height: 2)

            XCTAssertEqual(label.layer.shadowOffset, CGSize(width: 2, height: 2))
        }

        func testShadowRadiusChange() {
            let label = ThreeDLabel()
            label.customShadowRadius = 5.0

            XCTAssertEqual(label.layer.shadowRadius, 5.0)
        }

        func test3DFontEnabled() {
            let label = ThreeDLabel()
            label.is3DFont = true

            // Assuming the default font is not "NexaRustSlab-BlackShadow01.otf"
            XCTAssertNotEqual(label.font, UIFont(name: "NexaRustSlab-BlackShadow01", size: label.font.pointSize))
        }

        func test3DFontDisabled() {
            let label = ThreeDLabel()
            label.is3DFont = false

            // Assuming the default font is "NexaRustSlab-BlackShadow01.otf"
            if let fontURL = Bundle.main.url(forResource: "NexaRustSlab-BlackShadow01", withExtension: "otf") {
                if let fontDataProvider = CGDataProvider(url: fontURL as CFURL) {
                    if let font = CGFont(fontDataProvider) {
                        XCTAssertEqual(label.font, UIFont(name: "\(font)", size: label.font.pointSize))
                    }
                }
            }
        }
    }

