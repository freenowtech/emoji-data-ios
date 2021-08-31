//
//  Bundle+MyModule.swift
//  
//
//  Created by Óscar Figuerola Salas on 31/8/21.
//

import Foundation

private class CurrentBundleFinder {}

/**
 * This extension fixes issues when accessing the bundle from test targets, for more info:
 * https://forums.swift.org/t/update-on-implementation-only-imports/26996
 */

extension Bundle {

    static var myModule: Bundle = {

        let bundleName = "emojidataios_emojidataios"

        let candidates = [
            /* Bundle should be present here when the package is linked into an App. */
            Bundle.main.resourceURL,

            /* Bundle should be present here when the package is linked into a framework. */
            Bundle(for: CurrentBundleFinder.self).resourceURL,

            /* For command-line tools. */
            Bundle.main.bundleURL,

            /* Bundle should be present here when running previews from a different package, e.g. unit tests (this is the path to "…/Debug-iphonesimulator/"). */
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent(),
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent(),
            Bundle(for: CurrentBundleFinder.self).resourceURL?.deletingLastPathComponent(),
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }

        fatalError("Couldn't find bundle")
    }()
}
