//
//  DetailSwiftUIView.swift
//  CookBook WatchKit Extension
//
//  Created by ladmin on 17.12.2020.
//

import SwiftUI

struct DetailSwiftUIView: View {
    @State var det = false
    @State var recipe : Recipes =   Recipes(recipeName: "Борщ", recipeAuthor: "И.Иванов", recipeRating: 3.4, recipeText: "Говядина на косточке - 500г., капуста- 400г, 3-4 картофелины, 1 морковь, 1 больша луковица, 3-4 зуба чеснока, 2 вкусных сладких свеклы. Можно предварительно попробовать. Безвкусная свекла будет просто бесполезна, 2-3 ст.л. томатной пасты. Можно использовать и нормальные, свежие помидоры или помидоры в собственном соку. Я пользуюсь обычно именно ими., 2.ч.л соли.", recipeIcon: "ic_borsch", recipeImage: "im_borsch")
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Image(recipe.recipeIcon).resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                    Text(recipe.recipeName)
                        .font(.custom("SF Compact Display", size: 20))
                }
                Image(recipe.recipeImage).resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 266)
                VStack(alignment: .leading) {
                    Text("Автор")
                        .font(.custom("SF Compact Display", size: 20))
                    Text(recipe.recipeAuthor)
                        .font(.custom("SF Compact Display", size: 20))
                    Text("Описание")
                        .font(.custom("SF Compact Display", size: 20))
                    Text(recipe.recipeText)
                        .font(.custom("SF Compact Display", size: 20))
                        .lineLimit(2)
                        .onTapGesture {
                            self.det.toggle()
                        }
                }
                
                RaitingView().padding(.top, 6)
                NavigationLink(
                    destination: Text(recipe.recipeText),
                    isActive: $det,
                    label: {
                        Text("")
                            .background(Color.black)
                    }).hidden()
            }
        })
    }
}

struct DetailSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DetailSwiftUIView()
    }
}


struct RaitingView: View {
    var body: some View {
        HStack(spacing: 1) {
            Image(systemName: "sun.max.fill")
                .font(.system(size: 13))
                .foregroundColor(.white)
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.white.opacity(0.14))
            HStack(spacing: 1) {
                Rectangle()
                    .frame(width: 23, height: 3)
                    .foregroundColor(.green)
                Rectangle()
                    .frame(width: 23, height: 3)
                    .foregroundColor(.green)
                Rectangle()
                    .frame(width: 23, height: 3)
                    .foregroundColor(Color.green.opacity(0.5))
            }.clipShape(RoundedRectangle(cornerRadius: 9))
            .frame(width: 80, height: 50, alignment: .center)
            .background(Color.white.opacity(0.14))
            Image(systemName: "sun.max.fill")
                .font(.system(size: 18))
                .foregroundColor(.white)
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.white.opacity(0.14))
        }.clipShape(RoundedRectangle(cornerRadius: 9))
    }
}
