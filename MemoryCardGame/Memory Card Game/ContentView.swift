import SwiftUI

struct ContentView: View {
    private var cards: [String] {
        [
            "card2", "card2 copy",
            "card3", "card3 copy",
            "card4", "card4 copy",
            "card5", "card5 copy",
            "card6", "card6 copy",
            "card7", "card7 copy",
            "card8", "card8 copy",
            "card9", "card9 copy",
            "card10", "card10 copy",
            "card11", "card11 copy",
            "card12", "card12 copy",
            "card13", "card13 copy",
            "card14", "card14 copy"
        ].shuffled()
    }

    @State private var flippedCards = [Int]()
    @State private var matchedCards = Set<Int>()
    @State private var score = 0

    var body: some View {
        VStack {
            Text("Memory Game")
                .font(.largeTitle)
                .padding()
            
            Text("Score: \(score)")
                .font(.headline)
            
            GridStack(rows: 7, columns: 4) { row, col in
                let index = row * 4 + col
                if index < cards.count {
                    return AnyView(CardView(isFlipped: flippedCards.contains(index) || matchedCards.contains(index), imageName: cards[index])
                        .onTapGesture {
                            handleTap(index: index)
                        })
                } else {
                    return AnyView(EmptyView())
                }
            }
            .padding()
        }
    }

    private func handleTap(index: Int) {
        if flippedCards.contains(index) || matchedCards.contains(index) {
            return
        }
        
        flippedCards.append(index)
        
        if flippedCards.count == 2 {
            checkForMatch()
        }
    }
    
    private func checkForMatch() {
        let firstIndex = flippedCards[0]
        let secondIndex = flippedCards[1]
        
        if cards[firstIndex] == cards[secondIndex] {
            matchedCards.insert(firstIndex)
            matchedCards.insert(secondIndex)
            score += 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            flippedCards.removeAll()
        }
    }
}

struct CardView: View {
    let isFlipped: Bool
    let imageName: String
    
    var body: some View {
        ZStack {
            if isFlipped {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Image("back")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .frame(width: 100, height: 150)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
