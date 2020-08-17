#include <pwm_motor.h>
#include <lcd.c>

void main()
{
   
   int16 y_data, data;
   lcd_init();
   setup_adc(ADC_CLOCK_DIV_2);  // Focs/2 ayarlandý.
   setup_adc_ports(ALL_ANALOG); // Tüm 8 kanal analog input durmunda
   set_adc_channel(5);          // AN5 - RE0 - JOYSTICK Y EKSENÝ AKTÝF
   output_c(0);
   
   while(TRUE)
   {
      setup_ccp1(CCP_PWM); // PWM AKTÝF EDÝLDÝ.
      setup_timer_2(T2_DIV_BY_4,255,1);  // TMR2Prescale value = 4 oldu. PR2 = 255 oldu
      set_pwm1_duty(0);
      setup_adc_ports(ALL_ANALOG);
      set_adc_channel(5);  // AN5 - RE0 - joystick y ekseni aktif
      data = read_adc();
      delay_ms(1);
      
      // sol üst ve sað üst çapraz da 1023 deðerini görmek için aþaðýdaki kodlama yapýldý.
      if(data == 512 )
      {
         y_data = 0;
         setup_adc_ports(NO_ANALOGS);
         printf(lcd_putc,"\f ORTA  \n  %04Lu",y_data);
         set_pwm1_duty(y_data);
      }
      
      if(data >  512 )
      {
         output_high(PIN_C0);  // rc0 = 1 oldu NPN aktif => ileri yön
         y_data = (data-512)*2+1;
         setup_adc_ports(NO_ANALOGS);
         printf(lcd_putc,"\f ILERI  \n  %04Lu",y_data);
         set_pwm1_duty(y_data);
      }
      
      if(data <  512 )
      {
         output_low(PIN_C0);  // rc0 = 0 oldu PNP aktif => geri yön
         y_data = (511-data)*2+1;
         setup_adc_ports(NO_ANALOGS);
         printf(lcd_putc,"\f GERI  \n  %04Lu",y_data);
         set_pwm1_duty(y_data);
      }
      
      delay_ms(5); // ekranda kalma süresi
      
      
      
   }

}
