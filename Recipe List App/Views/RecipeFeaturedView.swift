//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Braxton Ward on 9/14/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel

    var body: some View {
        Text("Featured View")
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}
