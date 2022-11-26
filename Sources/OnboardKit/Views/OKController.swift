//
//  WelcomeSheetController.swift
//
//
//  Created by Kevin Romero Peces-Barba on 2/10/22.
//

import UIKit

public class OKController {
    var pages: [OKPage]
    var isSlideToDismissDisabled: Bool
    var onDismiss: () -> Void
    
    init(pages: [OKPage], isSlideToDismissDisabled: Bool = false, onDismiss: @escaping () -> Void = {}) {
        self.pages = pages
        self.isSlideToDismissDisabled = isSlideToDismissDisabled
        self.onDismiss = onDismiss
    }

    func get() -> UIViewController {
        let hc = ModalUIHostingController(rootView: OKView(pages: pages, onDismiss: onDismiss))
        hc.isModalInPresentation = isSlideToDismissDisabled
        return hc
    }
    
    public static func get(pages: [OKPage], isSlideToDismissDisabled: Bool = false, onDismiss: @escaping () -> Void = {}) -> UIViewController {
        OKController(pages: pages, isSlideToDismissDisabled: isSlideToDismissDisabled, onDismiss: onDismiss).get()
    }
}
