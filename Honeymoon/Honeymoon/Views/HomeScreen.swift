//
//  HomeScreen.swift
//  Honeymoon
//
//  Created by Saad Tahir on 28/05/2024.
//

import SwiftUI

struct HomeScreen: View {
    //MARK: - Properties
    @State var showAlert: Bool = false
    @State var showInfoView: Bool = false
    @State var showGuidView: Bool = false
    
    @State var lastCardindex: Int = 1
    
    private let dragAreaThreshold = 65.0
    @GestureState private var dragState = DragState.inActive
    @State var cardRemovalTransition = AnyTransition.trailingBottom
    
    private let haptics = UINotificationFeedbackGenerator()
    
    @State var cardViews: [DestinationCardView] = {
        var views = [DestinationCardView]()
        
        for index in 0..<2 {
            views.append(DestinationCardView(destination: DestinationData[index]))
        }
        
        return views
    }()
    
    func isTopCard(card: DestinationCardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == card.id }) 
        else {
            return false
        }
        return index == 0
    }
    
    func moveCards() {
        cardViews.removeFirst()
        lastCardindex += 1
        let destination = DestinationData[lastCardindex % DestinationData.count]
        let newCardView = DestinationCardView(destination: destination)
        cardViews.append(newCardView)
    }
    
    enum DragState {
        case inActive, pressing, dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inActive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inActive, .pressing:
                return false
            case .dragging:
                return true
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .inActive, .dragging:
                return false
            case .pressing:
                return true
            }
        }
    }
    
    //MARK: - Views
    var body: some View {
        VStack {
            //MARK: - Header
            HeaderView(showInfoView: $showInfoView, showGuideView: $showGuidView)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default)
            
            Spacer()
            
            //MARK: - Cards View
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(isTopCard(card: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                Image(systemName: "xmark.circle")
                                    .modifier(SymbolModifier())
                                    .opacity((dragState.translation.width < -dragAreaThreshold && 
                                              isTopCard(card: cardView)) ? 1 : 0)
                                
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity((dragState.translation.width > dragAreaThreshold && 
                                              isTopCard(card: cardView)) ? 1 : 0)
                            }
                        )
                        .offset(x: isTopCard(card: cardView) ? dragState.translation.width : 0,
                                y:isTopCard(card: cardView) ? dragState.translation.height : 0)
                        .scaleEffect((dragState.isDragging && isTopCard(card: cardView)) ? 0.85 : 1)
                        .rotationEffect(
                            Angle(
                                degrees: isTopCard(card: cardView) ? (dragState.translation.width / 12) : 0
                            )
                        )
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(
                            LongPressGesture(minimumDuration: 0.02)
                                .sequenced(before: DragGesture())
                                .updating($dragState,
                                          body: { (value, state, tranaction) in
                                              switch value {
                                              case .first(true):
                                                  state = .pressing
                                              case .second(true, let drag):
                                                  state = .dragging(translation: drag?.translation ?? .zero)
                                              default:
                                                  break
                                              }
                                })
                                .onChanged { value in
                                    guard case .second(true, let drag) = value
                                    else {
                                        return
                                    }
                                    
                                    if (drag?.translation.width ?? .zero) < -dragAreaThreshold {
                                        cardRemovalTransition = .leadingBottom
                                    }
                                    
                                    if (drag?.translation.width ?? .zero) > dragAreaThreshold {
                                        cardRemovalTransition = .trailingBottom
                                    }
                                }
                                .onEnded { value in
                                    switch value {
                                    case .second(true, let drag):
                                        if (drag?.translation.width ?? .zero) < -dragAreaThreshold ||
                                            (drag?.translation.width ?? .zero) > dragAreaThreshold {
                                            PlaySound.shared.play(sound: "sound-rise", type: "mp3")
                                            haptics.notificationOccurred(.success)
                                            moveCards()
                                        }
                                    default:
                                        break
                                    }
                                }
                        )
                }
            }
            
            Spacer()
            
            //MARK: - Footer
            FooterView(showAlert: $showAlert)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default)
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("SUCCESS"),
                message: Text("Wishing lovely and most precious of the times togather for the amazing couple."),
                dismissButton: .default(Text("Happy Honeymoon!!"))
            )
        }
    }
}

#Preview {
    HomeScreen()
}
