

//////////////////////////////////////////////////////////////////////////////// 
///                               DS1307.C                                   /// 
///                     Driver for Real Time Clock                           /// 
///                                                                          /// 
/// ds1307_init() - Enable oscillator without clearing the seconds register -/// 
///                 used when PIC loses power and DS1307 run from 3V BAT     /// 
///               - Disable squarewave output                                /// 
///                                                                          /// 
/// ds1307_set_date_time(day,mth,year,dow,hour,min,sec)  Set the date/time   /// 
///                                                                          /// 
/// ds1307_get_date(day,mth,year,dow)               Get the date             /// 
///                                                                          /// 
/// ds1307_get_time(hr,min,sec)                     Get the time             /// 
///                                                                          /// 
//////////////////////////////////////////////////////////////////////////////// 

#define RTC_SDA  PIN_C4 
#define RTC_SCL  PIN_C3 

#use i2c(master, sda=RTC_SDA, scl=RTC_SCL) 

BYTE bin2bcd(BYTE binary_value); 
BYTE bcd2bin(BYTE bcd_value); 

void ds1307_init(void) 
{ 
   BYTE seconds = 0; 

   i2c_start(); 
   i2c_write(0xD0);      // WR to RTC 
   i2c_write(0x00);      // REG 0 
   i2c_start(); 
   i2c_write(0xD1);      // RD from RTC 
   seconds = bcd2bin(i2c_read(0)); // Read current "seconds" in DS1307 
   i2c_stop(); 
   seconds &= 0x7F; 

   delay_us(3); 

   i2c_start(); 
   i2c_write(0xD0);      // WR to RTC 
   i2c_write(0x00);      // REG 0 
   i2c_write(bin2bcd(seconds));     // Start oscillator with current "seconds value 
   i2c_start(); 
   i2c_write(0xD0);      // WR to RTC 
   i2c_write(0x07);      // Control Register 
   i2c_write(0x80);     // Disable squarewave output pin 
   i2c_stop(); 

} 

void ds1307_set_date_time(BYTE day, BYTE mth, BYTE year, BYTE dow, BYTE hr, BYTE min, BYTE sec) 
{ 
  sec &= 0x7F; 
  hr &= 0x3F; 

  i2c_start(); 
  i2c_write(0xD0);            // I2C write address 
  i2c_write(0x00);            // Start at REG 0 - Seconds 
  i2c_write(bin2bcd(sec));      // REG 0 
  i2c_write(bin2bcd(min));      // REG 1 
  i2c_write(bin2bcd(hr));      // REG 2 
  i2c_write(bin2bcd(dow));      // REG 3 
  i2c_write(bin2bcd(day));      // REG 4 
  i2c_write(bin2bcd(mth));      // REG 5 
  i2c_write(bin2bcd(year));      // REG 6 
  i2c_write(0x80);            // REG 7 - Disable squarewave output pin 
  i2c_stop(); 
} 

void ds1307_get_date(BYTE &day, BYTE &mth, BYTE &year, BYTE &dow) 
{ 
  i2c_start(); 
  i2c_write(0xD0); 
  i2c_write(0x03);            // Start at REG 3 - Day of week 
  i2c_start(); 
  i2c_write(0xD1); 
  dow  = bcd2bin(i2c_read() & 0x7f);   // REG 3 
  day  = bcd2bin(i2c_read() & 0x3f);   // REG 4 
  mth  = bcd2bin(i2c_read() & 0x1f);   // REG 5 
  year = bcd2bin(i2c_read(0));            // REG 6 
  i2c_stop(); 
} 

void ds1307_get_time(BYTE &hr, BYTE &min, BYTE &sec) 
{ 
  i2c_start(); 
  i2c_write(0xD0); 
  i2c_write(0x00);            // Start at REG 0 - Seconds 
  i2c_start(); 
  i2c_write(0xD1); 
  sec = bcd2bin(i2c_read() & 0x7f); 
  min = bcd2bin(i2c_read() & 0x7f); 
  hr  = bcd2bin(i2c_read(0) & 0x3f); 
  i2c_stop(); 

} 

BYTE bin2bcd(BYTE binary_value) 
{ 
  BYTE temp; 
  BYTE retval; 

  temp = binary_value; 
  retval = 0; 

  while(TRUE) 
  { 
    // Get the tens digit by doing multiple subtraction 
    // of 10 from the binary value. 
    if(temp >= 10) 
    { 
      temp -= 10; 
      retval += 0x10; 
    } 
    else // Get the ones digit by adding the remainder. 
    { 
      retval += temp; 
      break; 
    } 
  } 

  return(retval); 
} 


// Input range - 00 to 99. 
BYTE bcd2bin(BYTE bcd_value) 
{ 
  BYTE temp; 

  temp = bcd_value; 
  // Shifting upper digit right by 1 is same as multiplying by 8. 
  temp >>= 1; 
  // Isolate the bits for the upper digit. 
  temp &= 0x78; 

  // Now return: (Tens * 8) + (Tens * 2) + Ones 

  return(temp + (temp >> 2) + (bcd_value & 0x0f)); 
} 
