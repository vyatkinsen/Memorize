import SwiftUI

struct ContentView: View {
    var topTitle = "Memorize!"
    
    enum emojiEnum {
        case vehiclesEmoji
        case flagsEmoji
        case foodEmoji
        
        var emojis: [String] {
            switch self {
            case .vehiclesEmoji:
                return ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🚚", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍️", "🛺", "🚍", "🚂"]
            case .flagsEmoji:
                return ["🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲", "🇦🇼", "🇦🇺", "🇦🇹", "🇦🇿", "🇧🇸", "🇧🇭", "🇧🇩", "🇧🇧", "🇧🇾"]
            case .foodEmoji:
                return ["🍔", "🍕", "🌭", "🍟", "🍗", "🍖", "🍤", "🍱", "🍣", "🍛", "🍜", "🍝", "🍲", "🍥", "🍢", "🍡", "🍦", "🍧", "🍨", "🍩", "🍪"]
            }
        }
    }

    @State var selectedEmojis: [String]
    @State var emojiCount = 20
    
    init() {
        selectedEmojis = emojiEnum.vehiclesEmoji.emojis
    }
    
    var body: some View {
        VStack {
            Text(topTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(selectedEmojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                vehicles
                 flags
                food
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
    }
    
    var vehicles: some View {
        Button {
            selectedEmojis = emojiEnum.vehiclesEmoji.emojis
        } label: {
            Image(systemName: "car.circle")
        }
    }
    
    var flags: some View {
        Button {
            selectedEmojis = emojiEnum.flagsEmoji.emojis
        } label: {
            Image(systemName: "flag.circle")
        }
    }
    
    var food: some View {
        Button {
            selectedEmojis = emojiEnum.foodEmoji.emojis
        } label: {
            Image(systemName: "fork.knife.circle")
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(Color.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
