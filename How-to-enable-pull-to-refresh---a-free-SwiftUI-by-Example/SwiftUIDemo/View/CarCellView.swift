//
//  CarCellView.swift
//  SwiftUIDemo
//
//  Created by 吴伟 on 5/27/24.
//

import SwiftUI

struct CarCellView: View {
    
    var viewModel: CarModel?
    
    var body: some View {
        if let viewModel = viewModel {
            HStack {
                if let url = URL(string: viewModel.imageUrl) {
                    AsyncImage(
                        url: url,
                        content: { image in
                            image.resizable()
                                 .aspectRatio(contentMode: .fit)
                                 .frame(maxWidth: 100, maxHeight: 100)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                 
                } else {
                    Image(systemName: "placeholder")
                }
                VStack {
                    Text(viewModel.modelType)
                    HStack {
                        Text(viewModel.price)
                        Text(viewModel.date)
                    }
                }
            }
        } else {
            Spacer()
        }
    }
}

#Preview {
    CarCellView()
}
