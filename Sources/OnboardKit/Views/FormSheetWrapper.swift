// Source: https://stackoverflow.com/a/68481116

import SwiftUI

class ModalUIHostingController: UIHostingController<OKView>, UIPopoverPresentationControllerDelegate {
    var onDismiss: () -> Void
    
    required init?(coder: NSCoder) { fatalError("") }
    
    override init(rootView: OKView) {
        self.onDismiss = rootView.onDismiss
        super.init(rootView: rootView)
        
        self.rootView.onDismiss = { [weak self] in
            rootView.onDismiss()
            self?.dismiss(animated: true)
        }
        
        modalPresentationStyle = .formSheet
        preferredContentSize = CGSize(width: iPadSheetDimensions.width, height: iPadSheetDimensions.height)
        presentationController?.delegate = self
    }
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) { onDismiss() }
}

class ModalUIViewController: UIViewController {
    var isSlideToDismissDisabled: Bool?
    var okView: OKView?
    
    func show() {
        guard let okView else { return }
        let hostVC = ModalUIHostingController(rootView: okView)
        hostVC.isModalInPresentation = isSlideToDismissDisabled ?? false
        present(hostVC, animated: true)
    }
}

struct FormSheet: UIViewControllerRepresentable {
    let show: Bool
    let isSlideToDismissDisabled: Bool
    let okView: OKView
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<FormSheet>) -> ModalUIViewController {
        let vc = ModalUIViewController()
        vc.okView = okView
        vc.isSlideToDismissDisabled = isSlideToDismissDisabled
        return vc
    }
    
    func updateUIViewController(_ uiViewController: ModalUIViewController, context: UIViewControllerRepresentableContext<FormSheet>) {
        if show {
            uiViewController.show()
        } else {
            uiViewController.dismiss(animated: true)
        }
    }
}

extension View {
    func formSheet(isPresented: Bool, isSlideToDismissDisabled: Bool, okView: OKView) -> some View {
        self.background(FormSheet(show: isPresented, isSlideToDismissDisabled: isSlideToDismissDisabled, okView: okView))
    }
}
