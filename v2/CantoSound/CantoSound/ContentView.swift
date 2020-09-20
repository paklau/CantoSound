//
//  ContentView.swift
//  CantoSound
//
//  Created by Pak Lau on 20/9/2020.
//

import SwiftUI


struct ContentView: View {
    @State var capturedImage = UIImage()
    
    func handlePhotoReceived(image: UIImage?) {
        if let image = image {
            capturedImage = image
        }
    }
    
    @State var isShowingCameraView = true
    var cameraView = CameraView()
    
    var body: some View {
        VStack {
            cameraView
                .frame(maxHeight: 200)
              
            Button(
                action : {
                    print("Button Pressed")
                    cameraView.controller.photoCaptureCompletionBlock = handlePhotoReceived
                    cameraView.controller.capturePhoto()
                    
                },
                label : {Text("Detect")
                })
                .frame(height: 200)
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            
            Image(uiImage: capturedImage)
                .resizable().aspectRatio(contentMode: .fit)
                .frame(height:200)
                .foregroundColor(.black)
                .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
//                .aspectRatio(contentMode: .fill)
               
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}