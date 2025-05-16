
<%@page import="data.Film"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%
    Locale indonesia = new Locale("id", "ID");
    NumberFormat nf = NumberFormat.getInstance(indonesia);
%>

<%
    ArrayList<Film> daftarFilm = new ArrayList<>();
    daftarFilm.add(new Film("Fast And Furious", "Action", 150, 50000, new String[]{"13:00", "16:00", "19:00"}));
    daftarFilm.add(new Film("Cars 4", "Animation", 100, 40000, new String[]{"10:00", "14:00", "18:00"}));
    session.setAttribute("daftarFilm", daftarFilm);
%>

<html>
<head>
    <title>Daftar Film</title>
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4895ef;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #4cc9f0;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7f6;
            padding: 20px;
            margin: 0;
            color: var(--dark);
        }
        
        .header {
            text-align: center;
            margin-bottom: 30px;
            padding: 20px;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .header h2 {
            margin: 0;
            font-size: 2rem;
        }
        
        .movie-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            padding: 20px;
        }
        
        .movie-card {
            width: 300px;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .movie-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
        }
        
        .movie-poster {
            width: 100%;
            height: 400px;
            object-fit: cover;
        }
        
        .movie-details {
            padding: 20px;
        }
        
        .movie-title {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 10px;
            color: var(--primary);
        }
        
        .movie-info {
            margin-bottom: 8px;
            font-size: 0.9rem;
        }
        
        .movie-showtimes {
            margin-top: 15px;
            padding-top: 15px;
            border-top: 1px dashed #ddd;
        }
        
        .showtime {
            display: inline-block;
            background-color: var(--accent);
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            margin-right: 5px;
            margin-bottom: 5px;
            font-size: 0.8rem;
        }
        
        .book-btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
            margin-top: 15px;
            transition: background-color 0.3s;
        }
        
        .book-btn:hover {
            background-color: var(--secondary);
        }
        
        .price {
            font-weight: 600;
            color: var(--secondary);
            font-size: 1.1rem;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="header">
    <h2>Daftar Film Tersedia</h2>
</div>

<div class="movie-container">
    <%
        for (int i = 0; i < daftarFilm.size(); i++) {
            Film f = daftarFilm.get(i);
            String posterUrl = "";
            if (f.getJudul().equals("Fast And Furious")) {
                posterUrl = "https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg";
            } else if (f.getJudul().equals("Cars 4")) {
                posterUrl = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8C96UVqtHytRQmupFPlkPv2jc9I.jpg";
            }
    %>
    <div class="movie-card">
        <img src="<%= posterUrl %>" alt="<%= f.getJudul() %>" class="movie-poster">
        <div class="movie-details">
            <div class="movie-title"><%= f.getJudul() %></div>
            <div class="movie-info"><strong>Genre:</strong> <%= f.getGenre() %></div>
            <div class="movie-info"><strong>Durasi:</strong> <%= f.getDurasi() %> menit</div>
            <div class="movie-info"><strong>Harga:</strong> <span class="price">Rp <%= nf.format(f.getHargaTiket()) %></span></div>
            
            <div class="movie-showtimes">
                <strong>Jam Tayang:</strong><br>
                <% for (String jam : f.getJamTayang()) { %>
                    <span class="showtime"><%= jam %></span>
                <% } %>
            </div>
            
            <form action="formpesan.jsp" method="get">
                <input type="hidden" name="index" value="<%= i %>">
                <button type="submit" class="book-btn">Pesan Tiket</button>
            </form>
        </div>
    </div>
    <% } %>
</div>
</body>
</html>