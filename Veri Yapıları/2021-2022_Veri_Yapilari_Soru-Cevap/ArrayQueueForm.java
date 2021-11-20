package onurHomework;

import javax.swing.JLabel;
import javax.swing.JTextField;

/**
 *
 * @author Ahmet
 */
public class ArrayQueueForm extends javax.swing.JFrame {

    JTextField t0, t1, t2, t3, t4, t5, t6, t7, t8, t9;
    JLabel l0, l1, l2, l3, l4, l5, l6, l7, l8, l9;
    JLabel rearLabel, frontLabel;
    int x, y, x1, y1;
    int textField_y;
    int delete_number_index;
    JLabel labelArray[];
    JTextField textFieldArray[];
    ArrayQueue_Homework kuyruk;

    public ArrayQueueForm() {
        initComponents();
        setLocationRelativeTo(this);
        setTitle("QUEUE APP");
        setResizable(false);
        kuyruk = new ArrayQueue_Homework(10);
        x = 100; y = 240; x1 = 50; y1 = 50;
        textField_y = 252;
        labelArray = new JLabel[]{l0, l1, l2, l3, l4, l5, l6, l7, l8, l9};
        textFieldArray = new JTextField[]{t0, t1, t2, t3, t4, t5, t6, t7, t8, t9};
        rearLabel = new JLabel("<------- REAR");
        add(rearLabel);
        frontLabel = new JLabel("<--- FRONT");
        frontLabel.setBounds(185, 252, 140, 25);
        add(frontLabel);
        frontLabel.setVisible(false);
        labelOlustur();
        textFieldOlustur();
        delete_number_index = 0;
    }

    private void textFieldOlustur() {
        for (int i = 0; i < textFieldArray.length; i++) {
            textFieldArray[i] = new JTextField();
            textFieldArray[i].setEditable(false);
        }

        for (int i = 0; i < textFieldArray.length; i++) {
            textFieldArray[i].setBounds(x + 30, textField_y, x1, y1 - 25);
            textField_y = textField_y - 20;
        }

        for (int i = 0; i < textFieldArray.length; i++) {
            add(textFieldArray[i]);
        }
    }

    private void labelOlustur() {
        for (int i = 0; i < labelArray.length; i++) {
            labelArray[i] = new JLabel(String.valueOf(i));
        }

        for (int i = 0; i < labelArray.length; i++) {
            labelArray[i].setBounds(x, y, x1, y1);
            y = y - 20;
        }

        for (int i = 0; i < labelArray.length; i++) {
            add(labelArray[i]);
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        ekleBtn = new javax.swing.JButton();
        cikarBtn = new javax.swing.JButton();
        gosterBtn = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        sayiTextField = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        ekleBtn.setText("Ekle()");
        ekleBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ekleBtnActionPerformed(evt);
            }
        });

        cikarBtn.setText("Çıkar()");
        cikarBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cikarBtnActionPerformed(evt);
            }
        });

        gosterBtn.setText("Göster()");
        gosterBtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                gosterBtnActionPerformed(evt);
            }
        });

        jLabel1.setText("SAYI:");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(sayiTextField, javax.swing.GroupLayout.DEFAULT_SIZE, 61, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addComponent(ekleBtn)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(cikarBtn)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(gosterBtn)
                .addGap(55, 55, 55))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(22, 22, 22)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ekleBtn)
                    .addComponent(cikarBtn)
                    .addComponent(gosterBtn)
                    .addComponent(jLabel1)
                    .addComponent(sayiTextField, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(255, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void ekleBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ekleBtnActionPerformed
        String sayiText = sayiTextField.getText();

        if (kuyruk.isEmpty()) {
            kuyruk.rear = 0;
            delete_number_index = 0;
            frontLabel.setBounds(185, 252, 140, 25);
            rearLabel.setVisible(true);

        }

        if (kuyruk.rear >= 9) {
            this.ekleBtn.setEnabled(false);
        }

        if (kuyruk.rear < 10 && !sayiText.isEmpty() && !sayiText.equals("")) {
            int sayi = Integer.parseInt(sayiText);
            textFieldArray[kuyruk.rear].setText(sayiText);
            rearLabel.setBounds(185, textFieldArray[kuyruk.rear].getY(), 140, 25);
            add(rearLabel);
            if (kuyruk.rear > 0) {
                frontLabel.setVisible(true);
            }
            kuyruk.add(sayi);
            this.sayiTextField.setText("");
            if (kuyruk.rear > 9) {
                this.sayiTextField.setEnabled(false);
            }
        }
    }//GEN-LAST:event_ekleBtnActionPerformed

    private void cikarBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cikarBtnActionPerformed

        if (!kuyruk.isEmpty()) {
            String delete_number = textFieldArray[delete_number_index].getText();
            this.sayiTextField.setText(delete_number);
            textFieldArray[delete_number_index].setText("");
            kuyruk.remove();
            if (!kuyruk.isEmpty()) {
                frontLabel.setBounds(185, textFieldArray[delete_number_index + 1].getY(), 140, 25);
            }
            delete_number_index++;
            if (frontLabel.getY() == rearLabel.getY()) {
                rearLabel.setVisible(false);
            }
        }

        if (kuyruk.isEmpty() && !sayiTextField.getText().isEmpty()) {
            frontLabel.setVisible(false);
            this.sayiTextField.setEnabled(true);
            this.ekleBtn.setEnabled(true);
        }
    }//GEN-LAST:event_cikarBtnActionPerformed

    private void gosterBtnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_gosterBtnActionPerformed
        String sayi = textFieldArray[delete_number_index].getText();
        this.sayiTextField.setText(sayi);
    }//GEN-LAST:event_gosterBtnActionPerformed

    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ArrayQueueForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ArrayQueueForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ArrayQueueForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ArrayQueueForm.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ArrayQueueForm().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton cikarBtn;
    private javax.swing.JButton ekleBtn;
    private javax.swing.JButton gosterBtn;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JTextField sayiTextField;
    // End of variables declaration//GEN-END:variables
}
