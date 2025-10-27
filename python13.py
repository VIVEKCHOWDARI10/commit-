import os

def unnamed_pipe_demo():
    r, w = os.pipe()  
    pid = os.fork()   

    if pid < 0:  
        os.close(r)  
        message = "Hello from parent"
        os.write(w, message.encode())  
        os.close(w)  

    else:  
        os.close(w)  
        data = os.read(r, 100)  
        print("Child received:", data.decode())
        os.close(r)  

unnamed_pipe_demo()

