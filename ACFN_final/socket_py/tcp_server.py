import socket
import array

def connect(PORT):

    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.bind(('', PORT))
    sock.listen(1)
    conn, addr = sock.accept()
    return conn

def send(conn, data):
    coded_data = data.tostring()
    conn.sendall(coded_data)

def recv(conn):
    data = conn.recv(1024)
    data_cast = array.array('f', data)
        
    return data_cast

def disconnect(conn):
    conn.close()