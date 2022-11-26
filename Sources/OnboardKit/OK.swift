import SwiftUI
 
@available(iOS 13.0, *)
struct OK: ViewModifier {
    @Binding var showSheet: Bool
    let pages: [OKPage]
    let onDismiss: () -> Void
    let isSlideToDismissDisabled: Bool

    func body(content: Content) -> some View {
        content
            .formSheet(isPresented: showSheet, isSlideToDismissDisabled: isSlideToDismissDisabled, okView: OKView(pages: pages, onDismiss: getOnDismiss()))
    }
    
    func getOnDismiss() -> () -> Void {
        return {
            showSheet = false
            onDismiss()
        }
    }
}

@available(iOS 13.0, *)
public extension View {
    func ok(isPresented showSheet: Binding<Bool>, onDismiss: @escaping () -> Void = {}, isSlideToDismissDisabled: Bool = false, pages: [OKPage]) -> some View {
        modifier(OK(showSheet: showSheet, pages: pages, onDismiss: onDismiss, isSlideToDismissDisabled: isSlideToDismissDisabled))
    }
}
