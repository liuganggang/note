class TestPhone {
  public static void main(String[] args) {
    USBPhone phone = new USBPhone();
    USB usb = phone;
    usb.read();
    usb.write();
  }
}