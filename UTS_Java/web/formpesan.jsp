
<%@page import="data.Film"%>
<%@page import="java.util.ArrayList"%>
<%
    int index = Integer.parseInt(request.getParameter("index"));
    ArrayList<Film> daftarFilm = (ArrayList<Film>) session.getAttribute("daftarFilm");
    Film filmDipilih = daftarFilm.get(index);
    
    String posterUrl = "";
    if (filmDipilih.getJudul().equals("Fast And Furious")) {
        posterUrl = "https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg";
    } else if (filmDipilih.getJudul().equals("Cars 4")) {
        posterUrl = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8C96UVqtHytRQmupFPlkPv2jc9I.jpg";
    }
%>

<html>
<head>
    <title>Form Pemesanan</title>
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4895ef;
            --light: #f8f9fa;
            --dark: #212529;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .booking-container {
            display: flex;
            max-width: 900px;
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        .movie-poster {
            width: 350px;
            height: 100%;
            object-fit: cover;
        }
        
        .booking-form {
            padding: 40px;
            flex: 1;
        }
        
        .form-title {
            color: var(--primary);
            margin-bottom: 30px;
            font-size: 1.8rem;
            font-weight: 600;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
        }
        
        .form-group input, .form-group select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-family: 'Poppins', sans-serif;
            font-size: 1rem;
            transition: border-color 0.3s;
        }
        
        .form-group input:focus, .form-group select:focus {
            border-color: var(--accent);
            outline: none;
        }
        
        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 10px;
        }
        
        .submit-btn:hover {
            background-color: var(--secondary);
        }
        
        .movie-info {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        
        .movie-info p {
            margin: 5px 0;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="booking-container">
    <img src="<%= posterUrl %>" alt="<%= filmDipilih.getJudul() %>" class="movie-poster">
    
    <div class="booking-form">
        <h2 class="form-title">Form Pemesanan Tiket</h2>
        
        <div class="movie-info">
            <p><strong>Film:</strong> <%= filmDipilih.getJudul() %></p>
            <p><strong>Genre:</strong> <%= filmDipilih.getGenre() %></p>
            <p><strong>Durasi:</strong> <%= filmDipilih.getDurasi() %> menit</p>
        </div>
        
        <form action="struk.jsp" method="post">
            <div class="form-group">
                <label for="nama">Nama Pemesan</label>
                <input type="text" id="nama" name="nama" required>
            </div>
            
            <div class="form-group">
                <label for="jumlah">Jumlah Tiket</label>
                <input type="number" id="jumlah" name="jumlah" min="1" required>
            </div>
            
            <div class="form-group">
                <label for="jam">Jam Tayang</label>
                <select id="jam" name="jam" required>
                    <% for(String jam : filmDipilih.getJamTayang()) { %>
                        <option value="<%= jam %>"><%= jam %></option>
                    <% } %>
                </select>
            </div>
            
            <input type="hidden" name="film" value="<%= filmDipilih.getJudul() %>">
            <input type="hidden" name="harga" value="<%= filmDipilih.getHargaTiket() %>">
            
            <button type="submit" class="submit-btn">Cetak Struk</button>
        </form>
    </div>
</div>
</body>
</html>