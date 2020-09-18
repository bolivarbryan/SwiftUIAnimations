import SwiftUI


protocol Theme {
    var glowColor: Color { get }
    var backgroundColor: Color  { get }
    var fieldColor: Color  { get }
    var scale: CGFloat  { get }
    var radius: CGFloat  { get }
    var offset: CGFloat  { get }
}

struct SunView: View {
    enum Step: Theme {
        case morning
        case sunset
        case night
        case midnight
        case sunrise
        
        var glowColor: Color {
            switch self {
            case .morning, .sunrise: return .yellow
            case .sunset: return .red
            case .night, .midnight: return .clear
            }
        }
        
        var fieldColor: Color {
            switch self {
            case .morning, .sunrise: return .green
            case .sunset: return .black
            case .night, .midnight: return .black
            }
        }  
        
        var backgroundColor: Color {
            switch self {
            case .morning: return .blue
            case .sunset: return .orange
            case .night: return Color(hex: "#141852")
            case .midnight: return Color(hex: "#191970")
            case .sunrise: return Color(hex: "#ffa700")
            }
        }
        
        var scale: CGFloat {
            switch self {
            case .morning: return 1
            case .night: return 0.8
            case .midnight: return 1.25
            case .sunset, .sunrise: return 2
            }
        }
        
        var radius: CGFloat {
            switch self {
            case .morning: return 36
            case .sunset, .sunrise: return 144
            case .night, .midnight: return 1
            }
        }
        
        var offset: CGFloat {
            switch self {
            case .morning: return -300
            case .sunset: return 300
            case .night: return -300
            case .sunrise: return 300
            case .midnight: return 450
            }
        }
    }
    
    @State private var flag: Step = .morning
    
    private let size: CGFloat = 100.0
    
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: size, height: size)
                .scaleEffect(flag.scale)
                .glow(color: flag.glowColor,
                      radius: flag.radius)
                .offset(y: flag.offset)
                .animation(.easeInOut(duration: 2.0))
            
            VStack {
                Spacer()
                Rectangle()
                    .fill(flag.fieldColor)
                    .frame(height: 100)
            }
            
            VStack {
                Spacer()
                Button( action: {
                    switch flag {
                    case .morning:
                        flag = .sunset
                    case .sunset:
                        flag = .night
                    case .night:
                        flag = .midnight
                    case .midnight:
                        flag = .sunrise
                    case .sunrise:
                        flag = .morning
                    }
                }, label: {
                    HStack(alignment: .bottom) {
                        Image(systemName: "sun.max.fill")
                        Text("Animate")
                    }
                    
                })
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding(.bottom, 40)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(flag.backgroundColor)
        .animation(.easeInOut(duration: 2.0))
        .edgesIgnoringSafeArea(.all)
    }
}

struct SunView_Previews: PreviewProvider {
    static var previews: some View {
        SunView()
    }
}
