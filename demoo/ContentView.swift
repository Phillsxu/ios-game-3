//
//  ContentView.swift
//  exx
//
//  Created by Fil on 2021/2/24.
//
 
import SwiftUI
struct Question{
    let name: String
    let words: String
    let en: String
    let spell: String
 
}
 
var questions: [Question] = [
    Question(name: "Kambing", words: "g  k  a  i  m  b  n", en: "Goat", spell: "k,a,m,b,i,n,g"),
    Question(name: "Kucing", words: "u  i  k  c  g  n", en: "Cat", spell: "k,u,c,i,n,g"),
    Question(name: "Anjing", words: "n  i  g  j  n  a", en: "Dog", spell: "a,n,j,i,n,g"),
    Question(name: "Babi", words: "i  a  b  b", en: "Pig", spell: "b,a,b,i"),
    Question(name: "Kelinci", words: "l  i  i  n  k  c  e", en: "Rabbit ", spell: "k,e,l,i,n,c,i"),
    Question(name: "Ayam", words: "m  a  y  a", en: "Chicken ", spell: "a,y,a,m"),
    Question(name: "Burung", words: "n  u  u  g  b  r", en: "Bird", spell: "b,u,r,u,n,g"),
    Question(name: "Singa", words: "i  a  s  g  n", en: "Lion", spell: "s,i,n,g,a"),
    Question(name: "Ular", words: "r  l  u  a", en: "Snake", spell: "u,l,a,r"),
    Question(name: "Monyet", words: "n  y  o  m  e  t", en: "Monkey ", spell: "m,o,n,y,e,t"),
]

struct ContentView: View {
    @State private var num = 0
    @State private var nums = 0
    @State private var answer = ""
    @State private var stat = ""
    @State private var hint = ""
    let speech = Speech()
    var body: some View {
        ZStack{
            Image("Home")
            .scaledToFill()
                Rectangle()
                .fill(Color.white)
                .frame(width: 500, height: 1000)
                .opacity(0.85)
            VStack{
                Text("Question " + String(num+1))
                    .font(.system(size: 30))
                    .padding()
                Image(questions[num].name)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .onTapGesture {
                    self.speech.setwords(words: questions[self.num].name)
                    self.speech.speaks()
                }
                Text(questions[num].en)
                    .padding()
                Text(hint)
                VStack{
                    HStack{
                        Text("Answer:")
                        TextField("your answer ", text: $answer)
                    }
                    Text(stat)
                        .foregroundColor(.red)
                }
                if(num<10){
                    Button("Check ") {
                        if(self.answer != questions[self.num].name){
                            self.answer = ""
                            self.stat = "Wrong answer"
                        }
                        if(self.answer == questions[self.num].name){
                            self.answer = ""
                            self.stat = ""
                            self.num += 1
                            self.hint = ""
                        }
                    }
                    .padding()
                    .font(.system(size: 20))
                    .background(Color.green)
                    .foregroundColor(.yellow)
                .padding()
                }
                HStack{
                    Button("Show Hint ") {
                        self.hint = "Hint:   " + (questions[self.num].words)
                    }
                    .padding()
                    .font(.system(size: 20))
                    .background(Color.blue)
                    .foregroundColor(.white)
                    Button("Spell ") {
                        self.speech.setwords(words: questions[self.num].spell)
                        self.speech.speaks()
                    }
                    .padding()
                    .font(.system(size: 20))
                    .background(Color.yellow)
                    .foregroundColor(.black)
                }
            }
        .scaledToFit()
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
