
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%
    Locale indonesia = new Locale("id", "ID");
    NumberFormat nf = NumberFormat.getInstance(indonesia);
%>

<%
    String nama = request.getParameter("nama");
    String film = request.getParameter("film");
    String jam = request.getParameter("jam");
    int jumlah = Integer.parseInt(request.getParameter("jumlah"));
    int harga = Integer.parseInt(request.getParameter("harga"));
    int total = jumlah * harga;
    
    String posterUrl = "";
    if (film.equals("Fast And Furious")) {
        posterUrl = "https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg";
    } else if (film.equals("Cars 4")) {
        posterUrl = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8C96UVqtHytRQmupFPlkPv2jc9I.jpg";
    }
%>

<html>
<head>
    <title>Struk Pemesanan</title>
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
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .receipt-container {
            max-width: 600px;
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        .receipt-header {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            padding: 25px;
            text-align: center;
        }
        
        .receipt-header h2 {
            margin: 0;
            font-size: 1.8rem;
        }
        
        .receipt-body {
            padding: 30px;
            display: flex;
            flex-direction: column;
        }
        
        .movie-poster {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        
        .receipt-details {
            width: 100%;
            border-collapse: collapse;
        }
        
        .receipt-details tr:not(:last-child) td {
            border-bottom: 1px solid #eee;
        }
        
        .receipt-details td {
            padding: 12px 0;
        }
        
        .receipt-details td:first-child {
            font-weight: 500;
            color: #666;
            width: 40%;
        }
        
        .receipt-details td:last-child {
            font-weight: 500;
        }
        
        .total-row {
            background-color: #f8f9fa;
            font-weight: 600 !important;
        }
        
        .total-row td {
            padding-top: 15px !important;
            padding-bottom: 15px !important;
        }
        
        .thank-you {
            text-align: center;
            margin-top: 30px;
            color: var(--primary);
            font-weight: 500;
            font-size: 1.1rem;
        }
        
        .print-btn {
            display: block;
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
            margin-top: 20px;
        }
        
        .print-btn:hover {
            background-color: var(--secondary);
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="receipt-container">
    <div class="receipt-header">
        <h2>Struk Pemesanan Tiket</h2>
    </div>
    
    <div class="receipt-body">
        <img src="<%= posterUrl %>" alt="<%= film %>" class="movie-poster">
        
        <table class="receipt-details">
            <tr>
                <td>Nama Pemesan</td>
                <td><%= nama %></td>
            </tr>
            <tr>
                <td>Film</td>
                <td><%= film %></td>
            </tr>
            <tr>
                <td>Jam Tayang</td>
                <td><%= jam %></td>
            </tr>
            <tr>
                <td>Jumlah Tiket</td>
                <td><%= jumlah %></td>
            </tr>
            <tr>
                <td>Harga per Tiket</td>
                <td>Rp <%= nf.format(harga) %></td>
            </tr>
            <tr class="total-row">
                <td>Total Harga</td>
                <td>Rp <%= nf.format(total) %></td>
            </tr>
        </table>
        
        <p class="thank-you">Terima kasih telah memesan tiket di bioskop kami!</p>
        
        <button onclick="window.print()" class="print-btn">Cetak Struk</button>
    </div>
</div>
</body>
</html>