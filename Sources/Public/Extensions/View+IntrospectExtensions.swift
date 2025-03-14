import SwiftUI
import SwiftUIIntrospect
import UIKit

public extension View {

    @MainActor
    func introspectScrollView(
        customizeHandler: @escaping (UIScrollView) -> Void
    ) -> some View {
        introspect(
            .scrollView,
            on: .iOS(.v14, .v15, .v16, .v17, .v18),
            scope: [.ancestor, .receiver],
            customize: customizeHandler
        )
    }

    @MainActor
    func introspectList(
        tableViewHandler: @escaping (UITableView) -> Void,
        collectionViewHandler: @escaping (UICollectionView) -> Void
    ) -> some View {
        introspect(
            .list, on: .iOS(.v14, .v15),
            scope: [.ancestor, .receiver],
            customize: tableViewHandler
        )
        .introspect(
            .list,
            on: .iOS(.v16, .v17, .v18),
            scope: [.ancestor, .receiver],
            customize: collectionViewHandler
        )
    }

    @MainActor
    func introspectList(
        tableViewHandler: @escaping (UITableView) -> Void
    ) -> some View {
        introspect(
            .list,
            on: .iOS(.v14), .iOS(.v15),
            scope: [.ancestor, .receiver],
            customize: tableViewHandler
        )
    }

}
