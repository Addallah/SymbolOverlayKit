//
//  SwiftUIView.swift
//  
//
//  Created by Addallah Hassan on 03/04/2024.
//

import SwiftUI


struct SymbolOverlayKitExamples: View {
    var body: some View {
		  if #available(iOS 16.0, *){
				VStack{
					 Circle()
						  .fill(.teal.gradient)
						  .frame(width: 200)
						  .symbolOverlayCircle(symbol: .symbol(systemName: "heart.fill"), size: 20, color: .white, opacity: 0.3)
					 
					 Capsule()
						  .fill(.teal.gradient)
						  .frame(width: 200,height: 100)
						  .symbolOverlayCapsule(symbol: .symbol(systemName: "heart.fill"), size: 15, color: .white, opacity: 0.3)
					 
					 
					 RoundedRectangle(cornerRadius: 25.0, style: .continuous)
						  .fill(.teal.gradient)
//						  .frame(width: 300,height: 100)
					 /// This will load the image from Assets Catalog
					 /// if your not seeing the symbol change the bundle to .module in the SymbolItem
						  .symbolOverlayRoundedRectangle(symbol: .bundle(named: "doodles"), size: 180, color: .white, opacity: 0.3, vspacing:112, hspacing: -1, rectangleCornerRadius: 25)
				}
		  }
    }
}

#Preview {
    SymbolOverlayKitExamples()
}
