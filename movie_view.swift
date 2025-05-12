struct ContentView: View {
    let movies = [
        Movie(title: "The Matrix Resurrections", rating: "PG-13"),
        Movie(title: "Avatar: The Way of Water", rating: "PG"),
        Movie(title: "Dune: Part Two", rating: "R"),
        Movie(title: "John Wick: Chapter 4", rating: "R"),
        Movie(title: "Sinners", rating: "R"),
        Movie(title: "Coming Soon...", rating: "")
    ]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            
            Color(.systemOrange)
                .ignoresSafeArea()
            
            
            VStack(spacing: 0) {
                
                Text("MoviePhone")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.top, 32)
                    .padding(.bottom, 24)
                    .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
                
               
                Divider()
                    .frame(height: 2)
                    .background(Color(.black))
                    .padding(.horizontal, 16)
                    .shadow(radius: 2)
                
               
                Text("Now Playing")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 24)
                    .padding(.top, 12)
                    .padding(.bottom, 16)
                
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(movies) { movie in
                            MovieCard(movie: movie)
                        }
                    }
                    .padding(.horizontal, 16)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}


struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let rating: String
}

struct MovieCard: View {
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Rectangle()
                .fill(Color.black.opacity(0.2))
                .frame(height: 180)
                .cornerRadius(12)
                .overlay(
                    Text(movie.title)
                        .foregroundColor(.white)
                )
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.headline)
                    
                
                if !movie.rating.isEmpty {
                    Text(movie.rating)
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 8)
        }
        .padding(12)
        .background(Color.black.opacity(0.1))
        .cornerRadius(14)
    }
}

#Preview {
    ContentView()
}
