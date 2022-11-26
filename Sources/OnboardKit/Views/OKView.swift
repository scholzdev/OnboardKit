import SwiftUI

@available(iOS 13.0, *)
struct OKView: View {
    var pages: [OKPage]
    var onDismiss: () -> Void
    
    var body: some View {
        NavigationView {
            if let firstPage = pages.first {
                if #available(iOS 14.0, *) {
                    OKPageView(page: firstPage, restPages: pages.filter({ $0.id != firstPage.id }), onDismiss: onDismiss)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                } else {
                  OKPageView(page: firstPage, restPages: pages.filter({ $0.id != firstPage.id }), onDismiss: onDismiss)
                        .navigationBarTitle(Text(""), displayMode: .inline)
                        .navigationBarHidden(true)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
