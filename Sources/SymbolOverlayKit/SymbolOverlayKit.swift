// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Foundation


@available(iOS 14.0, macOS 11.0, *)
struct SymbolItem: View {
	 let type: OverlayType
	 var color: Color
	 var size: CGFloat
	 
	 public init(overlayType: OverlayType,color: Color, size: CGFloat) {
		  self.type = overlayType
		  self.color = color
		  self.size = size
	 }
	 
	 var body: some View {
		  switch type {
				case .symbol( let systemName):
					 Image(systemName: systemName)
						  .font(.system(size: size))
						  .foregroundColor(color)
				case .bundle( let named):
					 Image(named,bundle: .main)
						  .resizable()
						  .scaledToFit()
						  .frame(width: size, height: size, alignment: .center)
		  }
	 }
}

@available(iOS 14.0, macOS 11.0, *)
public extension View {
    
    @ViewBuilder func symbolOverlayRoundedRectangle(symbol: OverlayType, size: CGFloat, color: Color?, opacity: Double, rotation: Double = -20, vspacing: CGFloat = 20, hspacing: CGFloat = 10, rectangleCornerRadius: Double) -> some View {
        var rows: [GridItem] { Array(repeating: GridItem(.fixed(10), spacing: vspacing, alignment: .center), count: 15) }
        
        self
            .overlay(
                
                LazyHGrid(rows: rows, alignment: .center, spacing: hspacing, pinnedViews: [], content: {
                    ForEach(0 ..< 180) { item in
								SymbolItem(overlayType: symbol, color: color ?? .secondary, size: size)
                    }
                }).rotationEffect(.degrees(rotation))
                    .opacity(opacity)
            ).clipped()
            .clipShape(RoundedRectangle(cornerRadius: rectangleCornerRadius))
        
    }
    
    @ViewBuilder func symbolOverlayRectangle(symbol: OverlayType, size: CGFloat, color: Color?, opacity: Double, rotation: Double = -20, vspacing: CGFloat = 20, hspacing: CGFloat = 10) -> some View {
        var rows: [GridItem] { Array(repeating: GridItem(.fixed(10), spacing: vspacing, alignment: .center), count: 15) }
        
        self
            .overlay(
                
                LazyHGrid(rows: rows, alignment: .center, spacing: hspacing, pinnedViews: [], content: {
                    ForEach(0 ..< 180) { item in
								SymbolItem(overlayType: symbol, color: color ?? .secondary, size: size)
                    }
                }).rotationEffect(.degrees(rotation))
                    .opacity(opacity)
            ).clipped()
            .clipShape(Rectangle())
        
    }
    
    @ViewBuilder func symbolOverlayCircle(symbol: OverlayType, size: CGFloat, color: Color?, opacity: Double, rotation: Double = -20, vspacing: CGFloat = 20, hspacing: CGFloat = 10) -> some View {
        var rows: [GridItem] { Array(repeating: GridItem(.fixed(10), spacing: vspacing, alignment: .center), count: 15) }
        
        self
            .overlay(
                
                LazyHGrid(rows: rows, alignment: .center, spacing: hspacing, pinnedViews: [], content: {
                    ForEach(0 ..< 180) { item in
								SymbolItem(overlayType: symbol, color: color ?? .secondary, size: size)          }
                }).rotationEffect(.degrees(rotation))
                    .opacity(opacity)
            ).clipped()
            .clipShape(Circle())
        
    }
    
    @ViewBuilder func symbolOverlayCapsule(symbol: OverlayType, size: CGFloat, color: Color?, opacity: Double, rotation: Double = -20, vspacing: CGFloat = 20, hspacing: CGFloat = 10) -> some View {
        var rows: [GridItem] { Array(repeating: GridItem(.fixed(10), spacing: vspacing, alignment: .center), count: 15) }
        
        self
            .overlay(
                
                LazyHGrid(rows: rows, alignment: .center, spacing: hspacing, pinnedViews: [], content: {
                    ForEach(0 ..< 180) { item in
								SymbolItem(overlayType: symbol, color: color ?? .secondary, size: size)                   }
                }).rotationEffect(.degrees(rotation))
                    .opacity(opacity)
            ).clipped()
            .clipShape(Capsule())
        
    }
    
    @ViewBuilder func symbolOverlayEllipse(symbol: OverlayType, size: CGFloat, color: Color, opacity: Double, rotation: Double = -20, vspacing: CGFloat = 20, hspacing: CGFloat = 10) -> some View {
        var rows: [GridItem] { Array(repeating: GridItem(.fixed(10), spacing: vspacing, alignment: .center), count: 15) }
        
        self
            .overlay(
                
                LazyHGrid(rows: rows, alignment: .center, spacing: hspacing, pinnedViews: [], content: {
                    ForEach(0 ..< 180) { item in
								SymbolItem(overlayType: symbol, color: color, size: size)                    }
                }).rotationEffect(.degrees(rotation))
                    .opacity(opacity)
            ).clipped()
            .clipShape(Ellipse())
        
    }   
    
}

@available(iOS 14.0, macOS 11.0, *)
public enum OverlayType {
	 case symbol(systemName: String)
	 case bundle(named: String)
}

