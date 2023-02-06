//
//  LocationSearchResultsView.swift
//  UberClone
//
//  Created by Gustavo Dias on 06/02/23.
//

import SwiftUI

struct LocationSearchResultsView: View {
    @StateObject var viewModel: LocationSearchViewModel
    let config: LocationResultsViewConfig
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.results, id: \.self) { result in
                    LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                viewModel.selectLocation(result, config: config)
                            }
                        }
                }
            }
        }
    }
}
