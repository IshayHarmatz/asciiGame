.model small
.stack 100h
.data
Filename db 'test.txt'
filehandle dw ?
NumOfBytes dw 10
Buffer db 200 dup (0) 
str db 200
strlen db 0
strtext db 200 dup(0)

.code
start:
      mov ax,@data
      mov ds,ax 
      
      lea dx,str
      mov ah,0ah
      int 21h 
      
      mov ax,0
      mov al,strlen
      lea bx,strtext
      add bx,ax
      mov [bx],0
      
      ;open file
      mov ah,3dh
      xor al,al
      lea dx,[strtext]
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


