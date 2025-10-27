import os 
print("before forking")
pid = os.fork()
if pid == 0 :
print("child process : PID =",os.getpid())
else :
print("parent porcess : PID =",os.getpid(),",child PID=",pid)

