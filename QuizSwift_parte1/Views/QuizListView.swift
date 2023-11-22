//
//  QuizListView.swift
//  QuizSwift_parte1
//
//  Created by c142 DIT UPM on 22/11/23.
//

import SwiftUI

struct QuizListView: View {

    // @State var quizzesModel = QuizzesModel()
    // var quizzesModel: QuizzesModel // si no lo herda de enviroment sino como parametro
    // para que lo herede del entorno lo tiene que heredar de esta manerea:
    @Environment (QuizzesModel.self) var quizzesModel
    @Environment (\.colorScheme) var colorScheme
    //@Environment (ScoresModel.self) var scoresModel
    // @Environment (QuizzesModel.self) var quizzesModel: QuizzesModel


    var body: some View {
        
        NavigationStack{
            List {
                ForEach(quizzesModel.quizzes){quizItem in
                    NavigationLink {
                        QuizItemPlayView(quizItem: quizItem)
                    } label: {
                        QuizItemRowView(quizItem: quizItem)
                        
                    }
                }
            }
            .foregroundColor(.green)
            .foregroundColor(.cLetras)
            
            .background(Color.cFou.edgesIgnoringSafeArea(.all))
            .listStyle(.plain)
            .navigationTitle("Practica 4 Quizzes")
            
            
        }
        .foregroundColor(.green)
        .onAppear ( perform: {
            guard quizzesModel.quizzes.count == 0 else {return}
            quizzesModel.load()
        })
        .background(Color.cFou.edgesIgnoringSafeArea(.all))
        //.padding()
        
    }
        
       //& .colorMultiply(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
}
/*
#Preview {
    QuizListView()
}*/

#Preview {
    
    var quizzesModel = QuizzesModel()
    var scoresModel = ScoresModel()

    // return QuizzItemPlayView(quizItem: model.quizzes[0])
    return
        QuizListView()
            .environment(quizzesModel)
            .environment(scoresModel)
    
    // return QuizzItemPlayView(quizItem: model.quizzes[0])
}
