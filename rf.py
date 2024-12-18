import serial

serial_port = '/dev/ttyUSB102'
baud_rate = 9600

ser = serial.Serial(serial_port, baud_rate, timeout=1)
print(f"Connected to {serial_port} at {baud_rate} baud.")

while True:
    try:
        if ser.in_waiting > 0:
            current_code = ser.readline().decode('utf-8').rstrip()
            log_rf = len(current_code) > 4
            if log_rf:
                print(f"{current_code}")

    except Exception as err:
        continue
