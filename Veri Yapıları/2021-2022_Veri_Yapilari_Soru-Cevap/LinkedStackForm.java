package onurHomework;

import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import javax.swing.*;

/**
 *
 * @author Ahmet
 */

public class LinkedStackForm implements ActionListener {

    JFrame frame;
    Graphics g;
    JButton ekleBtn, cikarBtn, gosterBtn;
    JTextField box, sayiTextField, topField;
    JLabel sayiLabel;
    LinkedStack_Homework linkedStack;
    int x = 50, y = 150, x1 = 50, y1 = 50;
    ArrayList<JTextField> list;
    
    public static void main(String[] args) {
        new LinkedStackForm().run();
    }
    
    public LinkedStackForm(){
        linkedStack = new LinkedStack_Homework();
        frame = new JFrame("Linked Stack App");
        list = new ArrayList<>();
        sayiTextField = new JTextField();
        sayiTextField.setBounds(70, 50, 100, 30);
        frame.setSize(600, 500);
        frame.setLocationRelativeTo(null);
        frame.setResizable(false);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(null);
        frame.setVisible(true);
        frame.add(sayiTextField);
        g = frame.getGraphics();
    }
    
    public void run(){
        sayiLabel = new JLabel("SAYI: ");
        ekleBtn = new JButton("Ekle()");
        cikarBtn = new JButton("Çıkar()");
        gosterBtn = new JButton("Göster()");
        sayiLabel.setBounds(20, 50, 50, 30);
        ekleBtn.setBounds(200, 50, 80, 30);
        cikarBtn.setBounds(300, 50, 80, 30);
        gosterBtn.setBounds(400, 50, 100, 30);
        frame.add(sayiLabel);
        frame.add(ekleBtn);
        frame.add(cikarBtn);
        frame.add(gosterBtn);
        ekleBtn.addActionListener(this);
        cikarBtn.addActionListener(this);
        gosterBtn.addActionListener(this);
    }    

    @Override
    public void actionPerformed(ActionEvent ae) {
        if(ae.getSource() == ekleBtn){
            ekleBtnDraw();
        }
        else if(ae.getSource() == cikarBtn) {
            cikarBtnDraw();
        }
        else if(ae.getSource() == gosterBtn){
            gosterBtnDraw();
        }
    }
    
    public void ekleBtnDraw(){
        String sayi = sayiTextField.getText();
        box = new JTextField(sayi);
        if(x >= 50 && x <= 470){
            createBox(x, 200);
    //        System.out.println(box.getX()+ " " +box.getWidth());
            x += 70;
            if(list.size()>1){
                g.drawLine(list.get(list.size()-2).getX() + list.get(list.size()-2).getWidth() +5, 257, list.get(list.size()-1).getX()+5, 257);
            }            
        }
    }
    
    public void createBox(int x, int y){
        box.setBounds(x, y, 50, 50);
        box.setEditable(false);
        frame.add(box);
        list.add(box);
    }
    
    public void cikarBtnDraw(){
        
    }
    
    public void gosterBtnDraw(){
        
    }
    
    
    

}
