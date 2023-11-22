//
//  QuizItemRowView.swift
//  QuizSwift_parte1
//
//  Created by c142 DIT UPM on 22/11/23.
//

import SwiftUI

struct QuizItemRowView: View {
    var quizItem: QuizItem
        var body: some View {
            //Image(quizItem.favourite ? "star_yellow" : "star_gray")
            //Image(quizItem.favourite ? "star_yellow" : "star_gray")
            // Imagen quiz

            HStack( spacing: 20) {
            // HStack(alignment: .center, spacing: 20) {

                EasyAsyncImage(url: quizItem.attachment?.url)
                    .frame(width: 60, height: 60)
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay{
                        Circle()
                            .stroke(Color.blue, lineWidth: 2)
                    }
                    .shadow(color: .blue, radius: 5, x: 0.0, y: 0.0)

                // AsyncImage(url: ( quizItem.attachment?.url))
                //     .frame(width: 200, height: 80)
                //     .clipped()
                //     .border(Color.black, width: 3)
                //     .clipShape(Circle())

                VStack (alignment: .leading) {
                    Image(quizItem.favourite ? "star_yellow" : "star_gray")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text(quizItem.question)
                        .lineLimit(3) //puede que este mal
                        .font(.title)
                        .fontWeight(.bold)
                }
                EasyAsyncImage(url: quizItem.author?.photo?.url)
                    .frame(width: 30, height: 30)
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay{
                        Circle()
                            .stroke(Color.blue, lineWidth: 2)
                    }
                    .shadow(color: .blue, radius: 5, x: 0.0, y: 0.0)

            }
            .background(Color.cPrincipal)
            //.preferredColorScheme(UIColor(named: "CSec"))
            
        }
}

#Preview {
    var model: QuizzesModel = {
            let m = QuizzesModel()
            m.load()
            return m
        } ()
    return QuizItemRowView(quizItem: model.quizzes[0])
        // return NavigationStack {
        //     QuizItemPlayView(quizItem: model.quizzes[0])
        // }
        // return QuizzItemPlayView(quizItem: model.quizzes[0])
}
