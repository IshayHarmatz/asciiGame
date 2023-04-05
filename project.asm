.model small
.stack 100h
.data
Filename db 'test.txt',0
filehandle dw ?
NumOfBytes dw 10
Buffer db 200 dup (0) 
.code
start:
      mov ax,@data
      mov ds,ax 
      
      ;open file
      mov ah,3dh
      xor al,al
      lea dx,[Filename]
      int 21h
      ;cmp ax,0
      ;jne exit
      mov [filehandle],ax
      
      ;read file
      mov ah,3fh
      mov bx,[filehandle]
      mov cx,NumOfBytes
      mov dx,offset Buffer  
      int 21h  
      
      ;put $ at the end
      lea bx,Buffer
      add bx,ax ;ax has the number of bytes that read frof the file
      mov [bx],'$'       
      
      ;print file
      lea dx,Buffer
      mov ah,9h 
      int 21h   
      
exit:
mov ah,4ch
int 21h
end      
       
      
      
      
      
      




