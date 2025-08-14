    struct ShareMyAppView: View {
        var body: some View {
            Text("Share my app")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            VStack(spacing: 20) {
                Image("")
                    .resizable()
                    .background().colorScheme(.dark)
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .clipShape(.buttonBorder)
                
                Text("Share QR code")
                    .font(.title2)
                    .fontWeight(.regular)
                
                Button {
                    print("Share my app button tapped")
                } label: {
                    Label(
                        title: {
                            Text("Share my app")
                                .fontWeight(.regular)
                                .font(.title3)
                        },
                        icon: {
                            Image(systemName: SFSymbol.share)
                                .font(.title3)
                        }
                    )
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(25)
                }
                
                Spacer()
            }
        }
    }