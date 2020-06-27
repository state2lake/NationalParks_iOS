//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jonathan Clark on 6/27/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        
        /*
         Lists work with identifiable data. You can make your data identifiable in one of two ways: by passing along with your data a key path to a property that uniquely identifies each element, or by making your data type conform to the Identifiable protocol.
         */
        
        /*
         passed landmarkData in the list initializer
         
         removed id: /.id from the List initialzer, because Landmark class has Identifiable protocol. Will now be able to use Landmark elements directly
         */
        NavigationView {
            
            List(landmarkData) { landmark in
                //            Instead of calling each row
                //            LandmarkRow(landmark: landmarkData[0])
                //            LandmarkRow(landmark: landmarkData[1])
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
