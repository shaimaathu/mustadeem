//
//  ContentView.swift
//  mustadeem
//
//  Created by shaimaa abdulrahman althubaiti on 12/06/1445 AH.
//

import SwiftUI
import MapKit
import UIKit
import CoreML
import Vision


struct ContentView: View {
    init(){
            
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = UIColor(.wai)
        
        }
        
        var body: some View {
            
            NavigationView {
                
                ZStack{
                    TabView {
                        mainPage()
                            .navigationBarHidden(true)
                            .tabItem {
                                
                                Image(systemName: "magnifyingglass")
                                Text("الرئيسية")
                                    .font(Font.custom("SF Pro Display", size: 15).weight(.bold))
                            }
                        // Scan Page
                        ScanPage()
                            .tabItem {
                                Image(systemName: "qrcode.viewfinder")
                                Text("الماسح الضوئي")
                                    .font(Font.custom("SF Pro Display", size: 15).weight(.bold))
                            }
                        // Main Page with Map
                        MapWithPin()
                            .tabItem {
                                Image(systemName: "map.fill")
                                Text("الخريطة")
                                    .font(Font.custom("SF Pro Display", size: 15).weight(.bold))
                            }
                        // Profile Page
                        ProfilePage()
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                            .tabItem {
                                Image(systemName: "person.fill")
                                Text("الحساب")
                                    .font(Font.custom("SF Pro Display", size: 15).weight(.bold))
                            }
                        
                    }
                    .edgesIgnoringSafeArea(.top)
                    .accentColor(.back)
                }
            }
        }
    }



struct ProfilePage: View {
    var body: some View {
        NavigationView {
            ZStack() {
                Group {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 400, height: 360)
                        .background(.col1)
                        .cornerRadius(40)
                        .offset(x: 0, y: -270)
                    HStack(spacing: 10){
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 140, height: 116)
                            .background(
                                Image(systemName: "gearshape")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.white)
                            )
                            .offset(x: 220, y: -300)
                        VStack(spacing: 10){
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 81, height: 81)
                                .background(
                                    Image("imm")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                )
                                .cornerRadius(15)
                                .offset(x: -60, y: -225.50)
                            Text("امال احمد")
                                .font(Font.custom("SF Pro Display", size: 35).weight(.bold))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .offset(x: -60, y: -230)
                            Text("amm3@hotmail.com")
                                .font(Font.custom("SF Pro Display", size: 11).weight(.light))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .offset(x: -60, y: -235.50)
                        }
                    }
                        HStack{
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 130, height: 115)
                                    .background(.white)
                                    .cornerRadius(24)
                                    .offset(x: 150 , y: -90.50)
                                    .shadow(radius: 5)
                                
                                VStack{
                                    Image("im1")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .offset(x: 150, y: -100.50)
                                    
                                    Text("33")
                                        .font(Font.custom("SF Pro Display", size: 15).weight(.bold))
                                        .foregroundColor(.back)
                                        .offset(x: 150, y: -90.50)
                                    Text("نقاط")
                                        .font(Font.custom("SF Pro Display", size: 10).weight(.light))
                                        .foregroundColor(.back)
                                        .offset(x: 150, y: -80)
                                }
                            }
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 130, height: 115)
                                    .background(.white)
                                    .cornerRadius(24)
                                    .offset(x: -150 , y: -90.50)
                                    .shadow(radius: 5)
                                VStack{
                                    Image("im3")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .offset(x: -150, y: -100.50)
                                    Text("89")
                                        .font(Font.custom("SF Pro Display", size: 15).weight(.bold))
                                        .foregroundColor(.back)
                                        .offset(x: -150, y: -90.50)
                                    Text("معاد تدويرها")
                                        .font(Font.custom("SF Pro Display", size: 10).weight(.light))
                                        .foregroundColor(.back)
                                        .offset(x: -150, y: -80)
                                }
                            }
                            }
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 300, height: 312)
                        .background(.col)
                        .cornerRadius(27)
                        .offset(x: 1, y: 170)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 204, height: 192)
                        .background(
                            Image("parcode")
                                .resizable()
                                .frame(width: 200, height: 200)
                            
                        )
                        .offset(x: -3, y: 170)
                }
            }
            .frame(width: 800, height: 2000)
            .background(.white)
            .ignoresSafeArea()
            .cornerRadius(20)
            

        }
    }
}

struct MapWithPin: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 24.7136, longitude: 46.6753),
        span: MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
    )

    let mapLocations = [
        MapLocation2(name: "St Francis Memorial Hospital", latitude: 24.5721273, longitude: 46.8828363),
        MapLocation2(name: "The Ritz-Carlton, San Francisco", latitude: 24.5591041, longitude: 46.9010787),
        MapLocation2(name: "Honey Honey Cafe & Crepery", latitude: 24.5247910, longitude: 46.7177755),
        MapLocation2(name: "St Francis Memorial Hospital", latitude: 24.4520385, longitude: 46.9949617),
        MapLocation2(name: "St Francis Memorial Hospital", latitude: 24.5301405, longitude: 46.7253698),
        MapLocation2(name: "St Francis Memorial Hospital", latitude: 24.5427638, longitude: 46.9012031),
        MapLocation2(name: "St Francis Memorial Hospital", latitude: 25.013456, longitude: 47.2054306)
    ]

    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: mapLocations) { location in
            MapPin(coordinate: location.coordinate, tint: .red)
            }
            .ignoresSafeArea()
    }
}

struct MapLocation2: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}


struct ScanPage: View {
    
    @State private var isCameraSheetPresented = false
       @State private var capturedImage: UIImage?

       var body: some View {
           NavigationView {
               VStack {
                   
                   
                   Button("التقط صورة لمنتج تستخدمه") {
                       isCameraSheetPresented.toggle()
                   }
                   .padding()
                   .background(Color.col)
                   .cornerRadius(10)
                   .sheet(isPresented: $isCameraSheetPresented) {
                       CameraSheet(capturedImage: $capturedImage)
                   }

                   if let image = capturedImage {
                       Image(uiImage: image)
                           .resizable()
                           .scaledToFit()
                           .frame(width: 200, height: 200)
                           .padding()

                       NavigationLink(destination: ResultView(capturedImage: $capturedImage)) {
                           Text("تعرف على المادة التي تستخدمها")
                               .padding()
                               .background(Color.col)
                               .cornerRadius(10)
                       }
                   }
               }.frame(width: 400, height: 900)
                   .background(.white)
                   .ignoresSafeArea()
           }
       }
    }

   


struct CameraSheet: View {
    @Binding var capturedImage: UIImage?

    var body: some View {
        ImagePicker(capturedImage: $capturedImage)
    }
}


struct ResultView: View {
    @Binding var capturedImage: UIImage?
    @State private var isSheetPresented = false
    @State private var classificationResult: String?
    @State  var isBlasSheetPresented = false
    @State  var isCartSheetPresented = false
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack {
                    if let result = classificationResult {
                        switch result {
                        case "blastic":
                            Button("النتيجة") {
                                isBlasSheetPresented.toggle()
                            }
                            .padding()
                            .background(Color.col)
                            .cornerRadius(10)
                            .sheet(isPresented: $isBlasSheetPresented) {
                                BlasSheet(capturedImage: $capturedImage)
                            }
                        case "carton":
                            Button("النتيجة") {
                                isCartSheetPresented.toggle()
                            }
                            .padding()
                            .background(Color.col)
                            .cornerRadius(10)
                            .sheet(isPresented: $isCartSheetPresented) {
                                CartSheet(capturedImage: $capturedImage)
                            }
                        default:
                            mainPage()
                        }
                    } else {
                        Button("تصنيف المنتج") {
                            classifyImage()
                        }
                        .padding()
                    }
                }
                .onAppear {
                    // Automatically classify the image when the view appears (optional)
                    classifyImage()
                }
                .padding()
                .background(.white)
                .ignoresSafeArea()
                .frame(width: 300, height: 300)
            }
            
        }
    }

    
    struct BlasSheet: View {
        @Binding var capturedImage: UIImage?
        @State private var istabSheetPresented = false
        var body: some View {
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack{
                    Rectangle()
                        .fill(Color.white.opacity(0.1)).frame(height: 300)
                    Rectangle()
                        .fill(Color.green.opacity(0.1)).frame(height: 600)
                        .cornerRadius(40)
                }
                VStack(alignment: .center){
                    if let image = capturedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding()
                    }
                    Text("البلاستيك ")
                        .font(
                            Font.custom("SF Compact Display", size: 46).weight(.semibold))
                        .foregroundColor(.back)
                    Text(" ")
                    Text("يستغرق البلاستيك إلى ٤٥٠ عاماً لتتحلل بشكل كامل ويتدفق سنوياً قرابة ١١ مليون متسبباً في موت ملايين من الكائنات الحية البحرية والبرية ")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.back)// لون النص
                    Text(" ")
                    Text(" ")
                        HStack{
                            Text("استخدم منتجات صديقة لللبيئة بديلة عن البلاستيك")
                                .font(
                                    Font.custom("SF Compact Display", size: 18).weight(.semibold))
                                .foregroundColor(.gray)
                            Image(systemName: "horn.blast")
                                .foregroundColor(.button)
                        }
                    Text(" ")
                                        Button("اماكن للتخلص من البلاستيك"){
                                            istabSheetPresented.toggle()
                                            }
                                            .padding()
                                            .background(Color.col)
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                            .sheet(isPresented: $istabSheetPresented) {
                                                TableView()
                                            }
                }
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
            .padding()
        }
    }
    
    
    struct CartSheet: View {
        @Binding var capturedImage: UIImage?
        @State private var istabSheetPresented = false

        var body: some View {
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack{
                    Rectangle()
                        .fill(Color.white.opacity(0.1)).frame(height: 300)
                    Rectangle()
                        .fill(Color.green.opacity(0.1)).frame(height: 600)
                        .cornerRadius(40)
                }
                VStack(alignment: .center){
                    if let image = capturedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding()
                    }
                    Text("الكرتون")
                        .font(
                            Font.custom("SF Compact Display", size: 46).weight(.semibold))
                    Text(" ")
                    Text("استخدام الورق المقوى ( الكرتون ) يشكل تحديات بيئية، ورغم أنه يُعتبر موادًا قابلة للتحلل بشكل طبيعي، إلا أن هناك عدة آثار سلبية قد تنشأ نتيجة لإنتاج واستخدامه.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.back)// لون النص
                    Text(" ")
                        
                        HStack{
                            Text("استخدم منتجات صديقة لللبيئة بديلة عن الكرتون")
                                .font(
                                    Font.custom("SF Compact Display", size: 18).weight(.semibold))
                                .foregroundColor(.gray)
                            Image(systemName: "horn.blast")
                                .foregroundColor(.button)
                        }
                        Text(" ")
                    Button("اماكن للتخلص من الكرتون"){
                        istabSheetPresented.toggle()
                        }
                        .padding()
                        .background(Color.col)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .sheet(isPresented: $istabSheetPresented) {
                            TableView()
                        }
                }
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
            .padding()
        }
    }
    
    private func classifyImage() {
        guard let model = try? myImagClassefiy().model else {
            classificationResult = "Error loading the model"
            return
        }

        guard let visionModel = try? VNCoreMLModel(for: model) else {
            classificationResult = "Error creating Vision model"
            return
        }

        guard let uiImage = capturedImage else {
            classificationResult = "No captured image"
            return
        }

        let ciImage = CIImage(image: uiImage)

        let handler = VNImageRequestHandler(ciImage: ciImage!)
        let request = VNCoreMLRequest(model: visionModel) { request, error in
            guard let results = request.results as? [VNClassificationObservation],
                  let firstResult = results.first else {
                self.classificationResult = "Unable to classify image"
                return
            }

            self.classificationResult = firstResult.identifier
        }

        do {
            try handler.perform([request])
        } catch {
            self.classificationResult = "Error performing image classification: \(error)"
        }
    }
}


struct ImagePicker: UIViewControllerRepresentable {
    @Binding var capturedImage: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.capturedImage = uiImage
            }

            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Update UI if needed
    }
}



struct who: View {
    var body: some View {
            ZStack {
                Image("w")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .offset(y:4)
                    .ignoresSafeArea()
                VStack {
                    Image("ww")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .offset(y:70)
                        .offset(x:-6)
                    HStack {Text("ماهو")
                            .offset(y:-3)
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0.453, green: 0.56, blue: 0.182))
                            .offset(x:90)
                            .font(.title)
                        Text("؟")
                            .offset(y:-3)
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0.453, green: 0.56, blue: 0.182))
                            .offset(x:-100)
                        .font(.title)}
                    
                    Text("يساعدك تطبيق مستديم على معرفة أنواع المواد الضارة بالبيئة ومدى تأثيرها ويرشدك للتخلص منها بأيسر الطرق لتساهم بحماية بيئتك،وطنك،وأسرتك")
                        .font(.headline)
                        .foregroundColor(.back)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                        }
                        .frame(width: 390, height: 1000)
                        .background(.bage)
                        .ignoresSafeArea()
                        .cornerRadius(20)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: CustomBackButton())
                        .padding()
        }
}

struct elham: View {
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack (spacing: 20){
                HStack{
                        Text("إلهام")
                            .font(Font.custom("SF Compact Display", size: 40)
                            .weight(.bold)).offset(x:150, y:-10)
                            .foregroundColor(.back)
                }
                HStack(spacing: 180){
                    Text("آخر الدراسات")
                        .font(
                            Font.custom("SF Compact Display", size: 20)
                                .weight(.black)
                        )
                        .offset(x:110, y: 10)
                        .foregroundColor(.back)
                        .multilineTextAlignment(.trailing)
                }
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 317, height: 1)
                    .background(.black)
                Link(destination: URL(string: "https://www.alarabiya.net/aswaq/economy/2021/09/21/اعادة-تدوير")!) {
                                Image("re")
                                    .resizable()
                                    .frame(width: 350, height: 250)
                                    .foregroundColor(.blue)
                            }
                            .buttonStyle(PlainButtonStyle())
                    HStack(spacing: 80){
                            Spacer()
                        Text("توصيات")
                            .offset(x:-40, y: 40)
                            .font(
                                Font.custom("SF Compact Display", size: 20)
                                    .weight(.black)
                            )
                            .foregroundColor(.back)
                            .multilineTextAlignment(.trailing)
                    }
                
                Rectangle()
                    .frame(width: 317, height: 1)
                    .background(.black)
                    .offset(x:-0,y:30)
                
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 355, height: 200)
                    .overlay(
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ZStack{
                            Rectangle()
                                .frame(width: 150, height: 170)
                                .foregroundColor(.col)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                            
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 150, height: 150)
                                .background(
                                    Image("it1")
                                        .resizable()
                                        .frame(width: 170, height: 170)
                                )}
                        ZStack{
                            Rectangle()
                                .frame(width: 150, height: 170)
                                .foregroundColor(.col)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 180, height: 180)
                                .background(
                                    Image("it2")
                                        .resizable()
                                        .frame(width: 190, height: 190)
                                )}
                        ZStack{
                            Rectangle()
                                .frame(width: 150, height: 170)
                                .foregroundColor(.col)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 180, height: 180)
                                .background(
                                    Image("it3")
                                        .resizable()
                                        .frame(width: 170, height: 170)
                                )}
                    }//hstakloc
                }
                .offset(x:-0,y:40)
                )
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton())
    }
    }


struct mainPage: View {
    var body: some View {
        ZStack{
                Color.white
                    .ignoresSafeArea()
            
                VStack(spacing: -10){
                    ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        // Menu Bar
                        NavigationLink(destination: who()) {
                                           HStack {
                                               Spacer()
                                               
                                               Image(systemName: "info.circle")
                                                   .imageScale(.large)
                                                   .foregroundColor(.back) // Change the color as needed
                                           }
                                       }
                                       .padding()
                        Spacer()
                    }
                    
                        VStack(spacing: 30){
                            
                            NavigationLink(destination: elham()){
                                ZStack{
                                    Rectangle()
                                        .cornerRadius(20)
                                        .frame(width: 345, height: 153)
                                        .offset(x: 0 , y: 0)
                                        .foregroundColor(.col1)
                                        .shadow(radius: 4)
                                    HStack{
                                        Image("t")
                                            .resizable()
                                            .frame(width: 110, height: 113)
                                            .offset(x: 0 , y: 10)
                                        Text("  كن صديقاً للبيئة !  ")
                                            .font(Font.custom("SF Compact Display", size: 25).weight(.bold))
                                            .foregroundColor(.white)
                                            .offset(x:0 , y: 5)
                                    }
                                }//zstak(alham)
                            }
                            HStack{
                                Spacer()
                                Text("المواد")
                                    .font(
                                        Font.custom("SF Compact Display", size: 25).weight(.bold)
                                    )
                                    .foregroundColor(.back)
                                    .font(.title)
                                    .multilineTextAlignment(.trailing)
                                Text(" ")
                            }
                            VStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 365, height: 150)
                                    .overlay(
                                        ScrollView(.horizontal, showsIndicators: false){
                                            HStack (spacing: 10){
                                                NavigationLink(destination: info2()) {
                                                    VStack(spacing:10){
                                                        ZStack{
                                                            Rectangle()
                                                                .frame(width: 150, height: 170)
                                                                .foregroundColor(.col)
                                                                .cornerRadius(20)
                                                                .shadow(radius: 4)
                                                            Rectangle()
                                                                .foregroundColor(.clear)
                                                                .frame(width: 150, height: 150)
                                                                .background(
                                                                    Image("blas")
                                                                        .resizable()
                                                                        .frame(width: 150, height: 150)
                                                                        .cornerRadius(10)
                                                                )}
                                                        Text("بلاستيك")
                                                            .font(
                                                                Font.custom("SF Compact Display", size: 20).weight(.semibold)
                                                            )
                                                            .font(.title)
                                                            .foregroundColor(.back)
                                                    }
                                                }
                                                NavigationLink(destination: info()){
                                                    VStack(spacing:10){
                                                        ZStack{
                                                            Rectangle()
                                                                .frame(width: 150, height: 170)
                                                                .foregroundColor(.col)
                                                                .cornerRadius(20)
                                                                .shadow(radius: 4)
                                                            Rectangle()
                                                                .foregroundColor(.clear)
                                                                .frame(width: 150, height: 150)
                                                                .background(
                                                                    Image("cr")
                                                                        .resizable()
                                                                        .frame(width: 150, height: 150)
                                                                        .cornerRadius(10)
                                                                )}
                                                        Text("كرتون")
                                                            .font(
                                                                Font.custom("SF Compact Display", size: 20).weight(.semibold)
                                                            )
                                                            .font(.title)
                                                            .foregroundColor(.back)
                                                    }
                                                }
                                                VStack(spacing:10){
                                                    ZStack{
                                                        Rectangle()
                                                            .frame(width: 150, height: 170)
                                                            .foregroundColor(.col)
                                                            .cornerRadius(20)
                                                            .shadow(radius: 4)
                                                        Rectangle()
                                                            .foregroundColor(.clear)
                                                            .frame(width: 150, height: 150)
                                                            .background(
                                                                Image("p 1")
                                                                    .resizable()
                                                                    .frame(width: 150, height: 150)
                                                                    .cornerRadius(10)
                                                            )}
                                                    Text("ورق")
                                                        .font(
                                                            Font.custom("SF Compact Display", size: 20).weight(.semibold)
                                                        )
                                                        .font(.title)
                                                        .foregroundColor(.back)
                                                }
                                            }//hstak
                                        }//scroll
                                    )
                            }//vstak
                            .navigationBarHidden(true)
                            HStack{
                                Spacer()
                                
                                Text("أماكن إعادة التدوير ")
                                    .font(
                                        Font.custom("SF Compact Display", size: 25).weight(.bold)
                                    )
                                    .foregroundColor(.back)
                                    .font(.title)
                            }
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 365, height: 155)
                                .overlay(
                                    ScrollView(.vertical, showsIndicators: false){
                                        VStack{
                                            NavigationLink(destination: TableView()){
                                                        Rectangle()
                                                            .foregroundColor(.clear)
                                                            .frame(width: 330, height: 150)
                                                            .background(
                                                                Image("rr")
                                                                    .resizable()
                                                            )
                                                            .cornerRadius(20)
                                            }
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: 330, height: 150)
                                                .background(
                                                    Image("kh")
                                                        .resizable()
                                                )
                                                .cornerRadius(20)
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: 330, height: 150)
                                                .background(
                                                    Image("jub")
                                                        .resizable()
                                                )
                                                .cornerRadius(20)
                                            Rectangle()
                                                .foregroundColor(.clear)
                                                .frame(width: 330, height: 150)
                                                .background(
                                                    Image("je")
                                                        .resizable()
                                                )
                                                .cornerRadius(20)
                                        }//vstakloc
                                    }//scrollloc
                                )
                        }
                    }//holevstak
                }
            }
        }
    }




struct info: View {
    var body: some View {
        
        ZStack{
        
                        VStack{
                        Text(" ")
                            Text(" ")
                            Text(" ")
                            Text(" ")
                        ZStack{
                            
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 395, height: 700)
                        .background(.col)
                        .cornerRadius(20)
                        .offset(y: 0)
                        .offset(x: 0)
                        .overlay(
                                           ScrollView {
                                               VStack{
                                                   Text("الكرتون")
                                                       .font(
                                                           Font.custom("SF Compact Display", size: 30).weight(.bold)
                                                       )
                                                       .multilineTextAlignment(.center)
                                                       .offset(x: 0 , y: 0)
                                                       .font(.title)
                                                       .foregroundColor(.back)
                                                   Text("   استخدام الورق المقوى ( الكرتون ) يشكل تحديات بيئية، ورغم أنه يُعتبر موادًا قابلة للتحلل بشكل طبيعي، إلا أن هناك عدة آثار سلبية قد تنشأ نتيجة لإنتاج واستخدامه. إليك بعض الأمور التي يمكن أن تؤدي إلى ضرر بيئي: تقطيع الأشجار: إنتاج الورق المقوى ( الكرتون ) يعتمد أساسًا على استخدام الأشجار كمصدر للألياف الورقية. عمليات تقطيع الأشجار قد تؤدي إلى فقدان التنوع البيولوجي وتغيير في النظم البيئية. استهلاك المياه: الورق المقوى ( الكرتون ) يتطلب كميات كبيرة من المياه، وعمليات التبييض التي تستخدم في بعض عمليات تصنيعه قد تسبب في تلوث المياه. استهلاك الطاقة: عمليات إنتاج الورق المقوى ( الكرتون ) تتطلب كميات كبيرة من الطاقة، وخاصة إذا تم استخدام تقنيات التصنيع التقليدية. تلوث الهواء: بعض عمليات تصنيع الورق المقوى ( الكرتون ) يمكن أن تتسبب في انبعاثات الغازات السامة والجسيمات الملوثة في الهواء. إعادة التصنيع الضعيفة: في بعض الحالات، قد تكون عمليات إعادة التصنيع غير فعّالة بما فيه الكفاية، مما يتسبب في إنتاج كميات كبيرة من النفايات. التخلص الغير مستدام: التخلص من الورق المقوى ( الكرتون ) بشكل غير مستدام يمكن أن يسهم في تكوين كميات كبيرة من النفايات، والتي قد تنتهي في المكبات الصحية أو تحترق بشكل يتسبب في انبعاث الغازات السامة. تحسين فعالية استخدام الموارد وتعزيز التصنيع الأخضر، بالإضافة إلى زيادة جهود إعادة التدوير واستخدام مصادر مستدامة للألياف الورقية، يمكن أن يساعد في تقليل تأثير الورق المقوى ( الكرتون ) على البيئة ")
                                                       .font(
                                                           Font.custom("SF Compact Display", size: 22).weight(.semibold)
                                                       )
                                                       .font(.title)
                                                       .fontWeight(.thin)
                                                       .italic()
                                                       .foregroundColor(.back)
                                                       .multilineTextAlignment(.center)
                                                       .padding()
                                               }.padding()
                                               
                                           }.padding()
                        )
                   
                }
                            
                        }
                            
            Image("cr")
                .resizable()
                .offset(x:130, y: -350)
                .frame(width: 190, height: 170)
                        }
                .frame(width: 800, height: 2000)
                .background(Color.white)
                .cornerRadius(20)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: CustomBackButton())
    }
}
    struct info2: View {
        var body: some View {
            ZStack{
                Image("blas")
                    .resizable()
                    .offset(x:160, y: -320)
                    .frame(width: 150, height: 170)
                Image("blas")
                    .resizable()
                    .offset(x:150, y: -300)
                    .frame(width: 150, height: 170)
                Image("blas")
                    .resizable()
                    .offset(x:110, y: -310)
                    .frame(width: 150, height: 170)
                            VStack{
                            Text(" ")
                                Text(" ")
                                Text(" ")
                                Text(" ")
                            ZStack{
                                
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 395, height: 700)
                            .background(.col)
                            .cornerRadius(20)
                            .offset(y: 0)
                            .offset(x: 0)
                            .overlay(
                                               ScrollView {
                                                   VStack{
                                                       Text("بلاستيك")
                                                           .font(
                                                               Font.custom("SF Compact Display", size: 30).weight(.bold)
                                                           )
                                                           .multilineTextAlignment(.center)
                                                           .offset(x: 0 , y: 0)
                                                           .font(.title)
                                                           .foregroundColor(.back)
                                                       Text("البلاستيك يسبب العديد من التأثيرات الضارة على البيئة والحياة البرية وقد أدى الاستخدام الواسع للبلاستيك إلى مشكلة بيئية عالمية هذه بعض الاضرار البيئية التي يسببها استخدام البلاستيك  تلوث المحيطات بسبب مايتم التخلص فيها النفايات البلاستيكية حيث يتجمع بعد فترة من الزمان على شكل جزيئات تسبب التلوث  ويهدد الحياة الطبيعية البحرية بالاضافة الى ان تصنيع البلاستيك يطلق غازات سامة في الهواء يؤثر بشكل رئيسي في الاحتباس الحراري الجدير بالذكر ان إعادة تدوير البلاستيك سيقلل بنحو ٢٥٪ من هذه الاضرار")
                                                           .font(
                                                               Font.custom("SF Compact Display", size: 25).weight(.semibold)
                                                           )
                                                           .font(.title)
                                                           .fontWeight(.thin)
                                                           .italic()
                                                           .foregroundColor(.back)
                                                           .multilineTextAlignment(.center)
                                                           .padding()
                                                   }.padding()
                                                   
                                               }.padding()
                            )
                    }
                            }
                            }
                    .frame(width: 800, height: 2000)
                    .background(Color.white)
                    .cornerRadius(20)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: CustomBackButton())
        }
    }



struct TableView: View {
    @State private var tableData: [[String]] =
    [
        ["الرياض", "مصنع صيهب للمنتجات البلاستيكية", "إعادة تدوير البلاستيك" , "siihb2013@gmail.com "],
        ["الرياض", "الشركة الوطنية لصهر الرصاص المحدودة", "إعادة تدوير البطاريات " , "Alhidary@live.com"],
        ["الرياض", "شركة التقدم الخليجي للصناعة شركة شخص واحد", "إعادة تدوير البلاستيك", "a0509741281@gmail.com"],
        ["الرياض", "شركة المصنع السعودي للحقن والمنتجات البلاستيكية", "إعادة تدوير البلاستيك" , "ssaudi-plastic@hotmail.com "],
        ["الرياض", "شركة رواتم للبلاستيك", "إعادة تدوير البلاستيك" , "md@rawatim.com "],
        ["الرياض", "شركة مصنع الوريف للبلاستيك", "إعادة تدوير البلاستيك" , "salwareefplastic@hotmail.com "],
        ["الرياض", "شركة مصنع بترول ناس", "إعادة تدوير الزيوت" , "snaaspetro@gmail.com "],
        ["الرياض", "شركة مصنع حديد الوطنية المحدودة", "إعادة  تدوير سكراب الحديد " , "faisal@wataniasteel.com "],
        ["الرياض", "شركة وطني للحديد والصلب المحدودة", "إعادة تدوير الحديد" , "siihb2013@gmail.com "],
    ]

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
                Text(" ")
                Text("اماكان اعادة التدوير بالرياض")
                    .font(Font.custom("SF Compact Display", size: 25))
                    .foregroundColor(.black)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(tableData, id: \.self) { rowData in
                            HStack{
                                ForEach(rowData, id: \.self) { cellData in
                                    CellView(text: cellData)
                                        .font(Font.custom("SF Compact Display", size: 12))
                                        .foregroundColor(.back)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                    }
                }
                .padding()
            }.frame(width: 360, height: 600)
                .padding()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton())
        }
    }

    struct CellView: View {
        var text: String

        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(Color.bac)
                    .padding()

                Text(text)
                    .frame(width: 60 , height: 60 )
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }


struct CustomBackButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack{
                Image(systemName: "chevron.backward")
                                .imageScale(.large)
                                .foregroundColor(.back)
                Text("رجوع") // Use any custom image or text for the back button
                    .imageScale(.large)
                    .foregroundColor(.back)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




