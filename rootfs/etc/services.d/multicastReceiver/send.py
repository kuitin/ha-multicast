import socket

MCAST_GRP = '224.0.0.1'
MCAST_PORT = 5353
import subprocess

subprocess.run(["echo", "Start Multicast python sender 1"])
# regarding socket.IP_MULTICAST_TTL
# ---------------------------------
# for all packets sent, after two hops on the network the packet will not
# be re-sent/broadcast (see https://www.tldp.org/HOWTO/Multicast-HOWTO-6.html)
MULTICAST_TTL = 2

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
sock.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_TTL, MULTICAST_TTL)

# For Python 3, change next line to 'sock.sendto(b"robot", ...' to avoid the
# "bytes-like object is required" msg (https://stackoverflow.com/a/42612820)
subprocess.run(["echo", "Start Multicast python sender 2"])
sock.sendto(b"robot", (MCAST_GRP, MCAST_PORT))