//
//  ContentView.swift
//  Shared
//
//  Created by Sherry Xu on 2021-12-27.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameViewModel: KingsCupViewModel
    @State private var showKAlert = false
    @State var isFacingUp = false
    @State var animated3d = false
    
    var body: some View {
        VStack {
            PlayerListView(viewModel: gameViewModel)
                .padding(.top)
                .padding(.leading)
            Spacer()
            ZStack {
                CardFront(card: gameViewModel.curr_card!).opacity(self.isFacingUp ? 1.0 : 0.0)
                CardBack().opacity(self.isFacingUp ? 0.0 : 1.0)
            }
            .modifier(FlipEffect(flipped: $isFacingUp, axis: (x: 1, y: 0), angle: animated3d ? 180 : 0))
            .onTapGesture {
                withAnimation(Animation.linear(duration: 0.5)) {
                    self.animated3d.toggle()
                    gameViewModel.flip()
                    isFacingUp = gameViewModel.curr_card!.isFacingUp
                    if gameViewModel.num_k == 4 {
                        showKAlert = true
                        gameViewModel.clear_num_k()
                    }
                }
            }
            .padding()
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.appBackground)
        .alert("This is the last K", isPresented: $showKAlert) {
            Button("Fine!!", role: .cancel) {}
        }
        
    }
}

struct FlipEffect: GeometryEffect {
    @Binding var flipped: Bool
    let axis: (x: CGFloat, y: CGFloat)
    var angle: Double
    
    var animatableData: Double {
        get {
            angle
        }
        set {
            angle = newValue
        }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        DispatchQueue.main.async {
            self.flipped = self.angle >= 90 && self.angle < 270
        }
        let tweakAngle = flipped ? 180 + angle : angle
        let a = CGFloat(Angle(degrees: tweakAngle).radians)
        
        var transform3d = CATransform3DIdentity
        transform3d.m34 = -1/max(size.width, size.height)
        transform3d = CATransform3DRotate(transform3d, a, axis.x, axis.y, 0)
        transform3d = CATransform3DTranslate(transform3d, -size.width/2.0, -size.height/2.0, 0)
        
        let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height/2.0))
        
        return ProjectionTransform(transform3d).concatenating(affineTransform)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameViewModel: KingsCupViewModel(num_players: 4, names: ["1", "2", "3", "4"]))
    }
}
