/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import model.MonAn621;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
/**
 *
 * @author ADMIN
 */
public class DAO621 {
     // Kết nối đến cơ sở dữ liệu 'monan621' trên SQL Server
    private static final String URL = "jdbc:sqlserver://localhost:1433;databasename=PhongChieu;";
    private static final String USER = "sa"; 
    private static final String PASSWORD = "quanquan3103"; 

    // Đọc danh sách món ăn từ bảng SQL Server
    public static List<MonAn621> con() {
        List<MonAn621> monAnList = new ArrayList<>();
        String query = "SELECT id, tenMonAn, giaMonAn, moTa FROM monan621";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // Tải driver JDBC cho SQL Server
            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement statement = connection.prepareStatement(query);
                 ResultSet resultSet = statement.executeQuery()) {

                // Khởi tạo đối tượng định dạng cho tiền Việt
                NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));

                while (resultSet.next()) {
                    MonAn621 monAn = new MonAn621();
                    monAn.setId(String.valueOf(resultSet.getInt("id")));
                    monAn.setTenMonAn(resultSet.getString("tenMonAn"));

                    // Định dạng giá thành kiểu tiền Việt
                    double gia = resultSet.getDouble("giaMonAn");
                    String giaFormatted = formatter.format(Math.round(gia));
                    monAn.setGiaMonAn(giaFormatted);

                    monAn.setMoTa(resultSet.getString("moTa"));
                    monAnList.add(monAn);
                }
            } catch (SQLException e) {
                System.err.println("Lỗi khi kết nối với SQL Server: " + e.getMessage());
            }
        } catch (ClassNotFoundException e) {
            System.err.println("Không tìm thấy driver JDBC SQL Server: " + e.getMessage());
        }

        return monAnList; // Trả về danh sách món ăn
    }

    // Đọc danh sách món ăn từ bảng SQL Server theo từ khóa
    public static List<MonAn621> getDanhSachMonAnTheoTuKhoa(String tuKhoa) {
        List<MonAn621> monAnList = new ArrayList<>();
        String query = "SELECT id, tenMonAn, giaMonAn, moTa FROM monan621 WHERE tenMonAn LIKE ?";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // Tải driver JDBC cho SQL Server
            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement statement = connection.prepareStatement(query)) {

                // Thiết lập giá trị tham số từ khóa trong câu lệnh truy vấn
                statement.setString(1, "%" + tuKhoa + "%");
                try (ResultSet resultSet = statement.executeQuery()) {
                    NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));

                    while (resultSet.next()) {
                        MonAn621 monAn = new MonAn621();
                        monAn.setId(String.valueOf(resultSet.getInt("id")));
                        monAn.setTenMonAn(resultSet.getString("tenMonAn"));

                        // Định dạng giá thành kiểu tiền Việt
                        double gia = resultSet.getDouble("giaMonAn");
                        String giaFormatted = formatter.format(Math.round(gia));
                        monAn.setGiaMonAn(giaFormatted);

                        monAn.setMoTa(resultSet.getString("moTa"));
                        monAnList.add(monAn);
                    }
                }
            } catch (SQLException e) {
                System.err.println("Lỗi khi kết nối với SQL Server: " + e.getMessage());
            }
        } catch (ClassNotFoundException e) {
            System.err.println("Không tìm thấy driver JDBC SQL Server: " + e.getMessage());
        }

        return monAnList; // Trả về danh sách món ăn theo từ khóa
    }
    public static void main(String[] args) {
        new DAO621();
    }
}
