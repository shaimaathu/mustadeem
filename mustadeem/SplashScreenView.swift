
import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive{
            ContentView()
        }else{
            ZStack {
                VStack{
                VStack{
                    Rectangle()
                      .foregroundColor(.clear)
                      
                      .frame(width: 299, height: 16)
                      
                        Image("sp")
                        
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(width: 299, height: 161)
                          .clipped()
                    
                          .frame(width: 1030, height: 10000)
                          .background(
                            LinearGradient(
                              stops: [
                                Gradient.Stop(color: Color(red: 0.05, green: 0.19, blue: 0.18), location: 0.00),
                                Gradient.Stop(color: Color(red: 0.03, green: 0.11, blue: 0.11), location: 1.00),
                              ],
                              startPoint: UnitPoint(x: 0.5, y: 0),
                              endPoint: UnitPoint(x: 0.5, y: 1)
                            )
                          )
                          .cornerRadius(20)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size=0.9
                        self.opacity=1.8
                    }
                }
                
            }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline:.now()+2.0){
                        self.isActive=true
                    }
                }
                
            }
        }
       
       
        
       
    }
}

#Preview {
    SplashScreenView()
}
