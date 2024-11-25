import SwiftUI
import BoardUI
import ComposableArchitecture
import CompKit
import BoardKit

public struct ContentView: View {
    private let compStore: StoreOf<CompFeature> = Store(
        initialState: CompFeature.State()
    ) {
        CompFeature()
    }
    
    private let boardStore: StoreOf<BoardFeature> = Store(
        initialState: BoardFeature.State()
    ) {
        BoardFeature()
    }
    
    public var body: some View {
        BoardView(
            boardStore: boardStore,
            compStore: compStore
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
