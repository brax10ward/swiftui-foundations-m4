//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Braxton Ward on 9/14/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0

    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
                .bold()
            
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                    ForEach (0..<model.recipes.count, id: \.self) { index in
                        
                        if model.recipes[index].featured == true {
                            Button {
                                self.isDetailViewShowing = true
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                }
                            }
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5) , radius: 10, x: -15, y:5)
                            
                            
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Preparation Time: ")
                        .font(.headline)
                    Text(model.recipes[tabSelectionIndex].prepTime)
                }
                HStack {
                    Text("Highlights: ")
                        .font(.headline)
                    RecipeHighlightsView(highlights: model.recipes[tabSelectionIndex].highlights)
                }
               
            }
            .padding([.bottom, .leading])

        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }
    
    func setFeaturedIndex() {
        // Find the index of first recipe that is featured
        let  index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured == true
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
        
    }
}
