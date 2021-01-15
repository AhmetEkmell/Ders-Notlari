import java.sql.*;

public class database1 {

    public static void main(String[] args) throws SQLException {
       String connectionURL = "jdbc:derby://localhost:1527/veritabanim";

        //ConnectionURL, username and password should be specified in getConnection()
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(connectionURL, "kullanici", "1234");
            System.out.println("Bağlantı kuruldu!\n------------------------------ ");
            
            Statement durum = conn.createStatement();
            String sorgu = "select*from KISILER";
            ResultSet sonuc = durum.executeQuery(sorgu);
            
            ResultSetMetaData sutunBilgisi = sonuc.getMetaData();
            sonuc.next(); // İndis mantığında düşünürsek 0'dan başlıyor. Dolayısıyla bi next yapıp 1. değerden başlamasını sağlıyoruz.
            for (int i = 1; i <= sutunBilgisi.getColumnCount(); i++) {
                System.out.println("Sütun İsmi: "+sutunBilgisi.getColumnName(i));
                System.out.println("Sütun Tipi: "+sutunBilgisi.getColumnTypeName(i));
                System.out.println("Sutun Değeri: "+sonuc.getString(i)+"\n-----------------");
            }

//            while(sonuc.next()){
//                System.out.println(sonuc.getString("ISIM")+" || "+sonuc.getString(2));
//            }
            
            String ekle = "insert into KISILER values('MelikŞah',1055)";
            System.out.println("Ekleme yapıldı mı? => "+durum.executeUpdate(ekle));
            
        } catch (SQLException ex) {
            System.out.println("Bağlantı Hatası! ");
            ex.printStackTrace();
        }
        finally{
            conn.close();
        }
    }
    
}
