//
//  HomeView.swift
//  NetflixThumbnail
//
//  Created by yuseong on 9/13/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView{
            HStack{
                Image("logo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                Spacer()
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
            }
            
            AsyncImage(url: URL(string: "https://ios-poster-json.s3.ap-northeast-2.amazonaws.com/posters/0BigImagePoster/bigPoster.png")) { image in
                image
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit) //화면에 맞게 커짐
                    .frame(width: 300, height: 525)
            } placeholder: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray)
                    .frame(width: 300, height: 525)
                    .opacity(0.4)
                    .overlay(   //버퍼링
                        ProgressView()
                            .tint(Color.white)
                    )
            }
            .overlay(alignment: .bottom) {
                HStack{
                    Button(action: {
                        print("재생버튼 클릭됨")
                    }, label: {
                        Image(systemName: "play.fill")
                    })
                    .buttonStyle(.bordered)
                    Button(action: {
                        print("info버튼 클릭됨")
                    }, label: {
                        Image(systemName: "info.circle")
                    })
                    .buttonStyle(.bordered)
                }
                .padding()
            }

        }
        .background(.black)
        .foregroundStyle(.white)
    }
}

#Preview {
    HomeView()
}
