# This script listens to the QMK USB HID and will be used to display the currently active layer within the waybar. 

import hid

print('Initializing the reader')

VENDOR_ID = 0xFEED
PRODUCT_ID = 0x0000

h = hid.device()
h.open(VENDOR_ID, PRODUCT_ID)
print(f'Device has been registered: {h}')
while True:
    d = h.read(64)
    print("Device read % s" % d)
    if d:
        layer = d[0]
        with open("/tmp/qmk_layer", "w") as f:
            f.write(str(layer))

