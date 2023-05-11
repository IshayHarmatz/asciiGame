.model small
.stack 100h
.data     
msg1 db 13,10,'Enter a file name:',13,10,'$' 
retAddress dw ?
filehandle dw ?
NumOfBytes dw 200
Buffer db 100 dup (0) 
str db 100
strlen db 0
Filename db 100 dup(0)
crlf db 13,10,'$' 
str2 db 100
strlen2 db 0
Filename2 db 100 dup(0)
str3 db 100
strlen3 db 0
Filename3 db 100 dup(0) 
str4 db 100
strlen4 db 0
Filename4 db 100 dup(0)
.code
start:
      mov ax,@data
      mov ds,ax 
      
      call GetFile1 ;get file 1
      call GetFile2 ;get file 2
      call GetFile3 ;get file 3       
      call GetFile4 ;get file 4
      
      mov ah,2ch    ;random a numbber 0-99
      int 21h      
      and dl,0000011b  ;make the radom number to 0-3
      push dx     ; push the value of the random number (file)
      
      
      lea dx,crlf  ;get down a line
      mov ah,9h 
      int 21h
    
      call RandomFile   ;random a file and play the game
                                                              
      call CloseFile                                                        
exit:
mov ah,4ch
int 21h
   

proc GetFile1
     lea dx,msg1
      mov ah,9h 
      int 21h
      
      lea dx,str
      mov ah,0ah
      int 21h 
      
      xor ax,ax
      mov al,strlen
      lea bx,Filename
      add bx,ax
      mov [bx],0    ; put 0 at the end of the filt to be able to print him
      ret
endp GetFile1

proc GetFile2
     lea dx,msg1
      mov ah,9h 
      int 21h
      
      lea dx,str2
      mov ah,0ah
      int 21h
      
      xor ax,ax
      mov al,strlen2
      lea bx,Filename2
      add bx,ax
      mov [bx],0     ; put 0 at the end of the filt to be able to print him
      ret 
endp GetFile2

proc GetFile3
     lea dx,msg1
      mov ah,9h 
      int 21h
      
      lea dx,str3
      mov ah,0ah
      int 21h
      
      xor ax,ax
      mov al,strlen3
      lea bx,Filename3
      add bx,ax
      mov [bx],0     ; put 0 at the end of the filt to be able to print him
      ret 
endp GetFile3

proc GetFile4
     lea dx,msg1
      mov ah,9h 
      int 21h
      
      lea dx,str4
      mov ah,0ah
      int 21h 
      
      xor ax,ax
      mov al,strlen4
      lea bx,Filename4
      add bx,ax
      mov [bx],0     ; put 0 at the end of the filt to be able to print him
      ret
endp GetFile4  

proc RandomFile 
      push bp
      mov bp,sp
      mov ax,[bp+4]
      xor ah,ah
      cmp ax,0   ; if random number equal 0 push file 1
      je File1
      
      cmp ax,1   ; if random number equal 1 push file 2
      je File2
      
      cmp ax,2   ; if random number equal 2 push file 3
      je File3
      
      jmp File4  ; if random number equal 3 push file 4
File1: 
      push offset Filename
      Call PlayGame
      jmp return
File2:
      push offset Filename2
      call PlayGame
      jmp return
File3:
      push offset Filename3 
      call PlayGame
      jmp return     
File4:
      push offset Filename4  
      call PlayGame
      jmp return
return: 
      pop bp
      ret 2
endp RandomFile 

proc PlayGame
      push bp
      mov bp,sp    
      mov bx,[bp+4]
      mov ah,3dh
      xor al,al
      lea dx,[bx]
      int 21h
      ;cmp ax,0
      ;jne exit
      mov [filehandle],ax  
      mov cx,1000
PrintAFile:      
      ;read file
      mov ah,3fh
      mov bx,[filehandle]
      mov cx,NumOfBytes
      mov dx,offset Buffer  
      int 21h  
      
      ;put $ at the end
      lea bx,Buffer
      add bx,ax ;ax has the number of bytes that read from the file
      mov [bx],'$'
             
      cmp ax,0 ;if he don't read any bytes you stop the print
      je endPrint
      
      ;print file
      lea dx,Buffer
      mov ah,9h 
      int 21h
     
      loop PrintAFile
endPrint: 
      pop bp
      ret 2 
endp PlayGame     

proc CloseFile
    mov ah,3Eh
    mov bx,[filehandle]
    int 21h
    ret
endp CloseFile

end
      
      
      




