.model small
.stack 100h
.data     
msg1 db 13,10,'Enter a file name or zero to end write files:',13,10,'$' ;to print a msg for get filename input
msg2 db 13,10,'Enter num of characters that you want to see {more}',13,10,'$' ;to print a msg for get number of characters to print from a file input
msg3 db 13,10,'Guess which file it is :',13,10,'$';to print a msg for get guess of a file name
msg4 db 13,10,'Well done! You were right',13,10,'$' ;to print a msg that say you guess the right file
msg5 db 13,10,'You failed! Do you wan to get more characters?{yes or no}',13,10,'$'; to say you wrong and ask if yow want keep plaing        
msg6 db 13,10,'Enter any key to exit:','$' ;to end the program
msg7 db 'If you want to read the game instructions enter yes:',13,10,'$'; ask if yoy want see the instructions
msg8 db 13,10,'At first you enter up to 10 file names.$'; the instuctions
msg9 db 13,10,'Then you write how many characters you want to see from the file.$'  ; the instuctions
msg10 db 13,10,'At the end you guess which file it is. If you are right the game is over.$' ; the instuctions
msg11 db 13,10,'If you are wrong you can continue plaing and get more characters from the file.',13,10,'$'; the instuctions 
instr db 100  ; to get the answer if he want to see the instructions
instrlen db 0 ; the length of the answer
instrAnswer dw 100 dup (0)  ; the answer is placed here
returnAddress dw ? ; to return from a function to the ip place
filehandle dw ?  ; to see if you can print a file
NumOfBytes dw 10  ; The amount of characters that the program print from a file
Buffer db 100 dup (0) ; a referrence number to a file requsted by the user to be opened        
crlf db 13,10,'$'  ; print and get down a line
strOffset dw ? ;to store the first stroffset and get until 10 files
strlenOffset dw ?  ;to store the first strlenoffset and then store the len of the random file
FileOffset dw ?  ;to be abke to get until 10 files he store the offset in the data of the filename place
str db 100   ; to get file name 1
strlen db 0  ; The len of file name 1
Filename db 100 dup(0) ; The name of file 1
str2 db 100    ; to get file name 2
strlen2 db 0  ; The len of file name 2
Filename2 db 100 dup(0) ; The name of file 2
str3 db 100    ; to get file name 3
strlen3 db 0   ; The len of file name 3
Filename3 db 100 dup(0) ; The name of file 3
str4 db 100    ; to get file name 4
strlen4 db 0   ; The len of file name 4
Filename4 db 100 dup(0) ; The name of file 4  
str5 db 100   ; to get file name 5
strlen5 db 0  ; The len of file name 5
Filename5 db 100 dup(0) ; The name of file 5
str6 db 100    ; to get file name 6
strlen6 db 0  ; The len of file name 6
Filename6 db 100 dup(0) ; The name of file 6
str7 db 100    ; to get file name 7
strlen7 db 0   ; The len of file name 7
Filename7 db 100 dup(0) ; The name of file 7
str8 db 100    ; to get file name 8
strlen8 db 0   ; The len of file name 8
Filename8 db 100 dup(0) ; The name of file 8
str9 db 100  ; to get file name 9   
strlen9 db 0   ; The len of file name 9                                  
Filename9 db 100 dup(0) ; the name of file 9
str10 db 100   ; to get file name 10
strlen10 db 0   ; The len of file name 10
Filename10 db 100 dup(0) ; the name of file 10
strbyte db 100 ; to get the num of bytes to print from the file
strbylen db 0   ; the length of the input (num of byte) 
bytes db 100 dup(0); the num of bytes to print from file
strGuss db 100    ; to get the user guess of the file name 
strGusslen db 0   ; the length of the user guess
FileGuess db 100 dup(0) ; the guess witch file it is;
strAn db 100  ;  to get the user answer if he wants to keep playing
Anlen7 db 0   ; the answer length
Answer dw 100 dup(0) ;  the answer of the user if he wants to keep playing
totalBytes dw 100 dup(0) ; the total bytes (from the start of the program) that need to print from the file   
mone dw ? ; the number to print 10 characters from the file
macpil dw 1 ; to convert micidot to asarot and meot...
sherit dw ? ; to keep the sherit of bytes that need to print and it less then 10
result dw 0 ; the number of bytes that need to print after the convert
Yes dw 'yes' ; check if the user want keep playing 
.code  

start:
      mov ax,@data
      mov ds,ax
      
      lea dx,msg7   ; print msg7
      mov ah,9h 
      int 21h
      
      lea dx,instr  ; grt into instrAnswer the input - if he want to see the instructions
      mov ah,0ah
      int 21h
      
      mov ax,[instrAnswer]  ; check if the answer is yes
      cmp ax,[Yes]
      jne startGame   ; if it isn't yes don't print the instructions
      
      call instructions  ; if it is yes call instructions
startGame:
      push offset str
      push offset strlen
      push offset Filename
      
      call GetFiles ;get files
      mov bx,cx 
      xor dx,dx
      
      mov ah,2ch    ;random a numbber 0-99
      int 21h
      xor ax,ax
      mov al,dl      ; dl store number 0-99
      mov cx,10
      sub cx,bx
      div cl
      xor dx,dx
      mov dl,ah      
      push dx     ; push the value of the random number (file)
      
      lea dx,crlf  ;get down a line
      mov ah,9h 
      int 21h 
     
    
      call RandomFile   ;random a file and play the game
      mov ax,0                                                        
      call CloseFile                                                        
exit:  
      lea dx,msg6
      mov ah,9h 
      int 21h       ; print msg6
      
      mov ah,01h
      int 21h      ; get char from the user

      mov ah,4ch
      int 21h      ; end the program
      
;------------------------------------------------------------------       
; the function prints the instruction to the screen     
proc instructions
      lea dx,crlf  ;get down a line
      mov ah,9h 
      int 21h 
      
      lea dx,msg8
      mov ah,9h
      int 21h   ; print msg 8
      
      lea dx,msg9
      mov ah,9h
      int 21h    ;print msg 9
      
      lea dx,msg10
      mov ah,9h
      int 21h   ;print msg 10
      
      lea dx,msg11 ; print msg 11
      mov ah,9h
      int 21h    
      ret
endp instructions
;-------------------------------------------------------------------
; the function accepts parameters:strOffset, FileOffset and strlenOffset by reference
; the function gets until 10 file names and put them in the filename arrays that in the data
proc GetFiles 
    pop [returnAddress]
    pop [FileOffset]  
    pop [strlenOffset]
    pop [strOffset]
    
   
    mov cx,10
    mov si,0 
GetFile:
       
      lea dx,msg1
      mov ah,9h 
      int 21h       ; print msg1
        
      mov ax,[strOffset]
      add ax,si         ; put the name in the next filename
      
      lea dx,ax
      mov ah,0ah
      int 21h       ; get  filename 1 
      
      mov bx,[FileOffset]  
      add bx,si
      cmp [bx],30h  
      je NotFile    ; if you got 0 end GetFile
      
      xor ax,ax
      mov bx,[strlenOffset]
      add bx,si
      mov al,[bx]
      mov bx,[FileOffset]
      add bx,si
      lea bx,[bx]
      add bx,ax
      mov [bx],0    ; put 0 at the end of the file to be able to print him 
      add si,102d   ; go to the next fileOffset
      loop GetFile
NotFile:
      push [returnAddress] 
      ret 6
endp GetFiles
;---------------------------------------------------------------
; the function accepts pramter dx by value that has the number of the random file
; the function push a file name offset and filename length value according to the number it gets
proc RandomFile 
      push bp
      mov bp,sp
      mov ax,[bp+4] ;now ax store the rondom number
      xor ah,ah 
      mov si,0
      cmp ax,0
      je pushFileOffset ; if the random number is 0 jump and push the first filename offset
      mov cx,ax
addFileOffset:
      add si,102d  ;add si 102d to get the next file name offset
      
      loop addFileOffset
pushFileOffset:
      mov ax,[strlenOffset]
      add ax,si
      mov bx,ax      
      mov ax,[bx]
      push ax       ; push value of the random strlen
      

      mov ax,[FileOffset]
      add ax,si      
      push ax       ; push the random file offset
       
      
      call PlayGame  ; start the game with the random file
      pop bp
      ret 2
endp RandomFile 
; ------------------------------------------------------------- 
; the function accepts strlen by value and fileoffset by reference
; the function gets number of bytes to print from the file and check if the guess input is correct
proc PlayGame
      push bp
      mov bp,sp
      mov bx,[bp+4]  ;offset of the random file
again: 
      push bx
      mov [NumOfBytes],10   ; restart NumOfBytes by 10
      
      call getANumber   ; get a number of characters to print from the file
              
      
      lea dx,crlf  ;get down a line
      mov ah,9h 
      int 21h
      
      mov dh, 0    ; start print from the start of the screen
	  mov dl, 0
	  mov bh, 0
	  mov ax, 0
	  int 10h    
	  
	  mov ah, 00h    ; enlarge te screen to 80x25 
      mov al, 03h
      int 10h   
      
      mov ah,3dh     ;open a file 
      xor al,al 
      pop bx         ; bx has the random file offset
      lea dx,[bx]
      int 21h
      push bx

      mov [filehandle],ax
      xor cx,cx 
      cmp [mone],0   ; mone stores the number of times the program needs to print 10 bytes
      je moneEqu0    ; there is less then 10 bytes to print
PrintAFile:      
      mov ah,3fh       ;read file
    
      mov bx,[filehandle]
      mov cx,NumOfBytes
      mov dx,offset Buffer  
      int 21h  
           
      lea bx,Buffer  ;put $ at the end
      add bx,ax      ;ax has the number of bytes that read from the file
      mov [bx],'$'
             
      cmp ax,0    ;if he don't read any bytes you stop the print
      je endPrint
                           
      lea dx,Buffer    ;print the file
      mov ah,9h 
      int 21h
      
      cmp [NumOfBytes],10      
      jne endPrint 
      dec [mone]
      cmp [mone],0
      jnz PrintAFile ;if mone bigger then 10 the program keep printing
moneEqu0:
      mov ax,[sherit]
      mov [NumOfBytes],ax
      jmp PrintAFile    ; print only the number of bytes that sherit stores
      
endPrint:
      lea dx,msg3 ;print msg 3
      mov ah,9h 
      int 21h
      
      lea dx,strGuss  ; get the guss of file input into FileGuss 
      mov ah,0ah
      int 21h
      
        
      
      pop bx  ; bx has the name of the file
      mov cx,[bp+6] ; cl has the legth of the file name
      xor ch,ch
      cmp [strGusslen],cl ; check if the guss length and file name length are equal
      jne fail ; if they not equal you failed
      
      mov si,0 
      xor ax,ax
Gusses:      
      mov al,[FileGuess+si]   ; check if fileguss and file name are the same
      mov ah,[bx+si]
      cmp ah,al
      jne fail
      inc si
      loop Gusses
      
      lea dx,msg4  ; print msg 4
      mov ah,9h 
      int 21h            
      jmp endGame
fail:  
      lea dx,msg5 ; print msg 5
      mov ah,9h 
      int 21h 
      
      lea dx,strAn
      mov ah,0ah
      int 21h 
      mov ax,[Yes]
      cmp [Answer],ax  ; check if the user want to keep playing(yes)
      je again


endGame:      
      pop bp
      ret 4 
endp PlayGame
;-----------------------------------------------------------------
; the fuction gets a string from the user and convert to a number.
; then it divide the number by 10 and put at mone and sherit the results 
proc getANumber
     
      mov [macpil],1  ; restart the vars
      mov [result],0
      lea dx,msg2   ; print msg2
      mov ah,9h 
      int 21h
      
      lea dx,strbyte   ; put the input in bytes
      mov ah,0ah
      int 21h 
      
      xor cx,cx  
      cmp [strbylen],1 ; check if the input is one digit
      je oneDigit
      mov cl,[strbylen]
      dec cx 
      
length:            ;mul macpil by the length of the input number
      xor ax,ax
      mov al,10
      mul [macpil]
      mov [macpil],ax
      loop length
      
      mov cl,[strbylen] 
      mov si,0
convertToANumber:        ;make the input from string to a number
      mov al,[bytes+si]
      sub al,30h        ; make from ascii to number value
      xor ah,ah
      mul [macpil]
      add [result],ax 
      mov ax,[macpil]
      mov bx,10
      div bx 
      mov [macpil],ax
      inc si
      loop convertToANumber
       
      mov cx,[result]   ; cx has the convert number
      jmp moreThenOneDigit
       
oneDigit:
      sub [bytes],30h ; make from ascii to number value
      mov cl,[bytes]
      
moreThenOneDigit: 
      add [totalBytes],cx   ; add the result to total bytes
      mov ax,[totalBytes] 
      xor dx,dx 
      div [NumOfBytes]   ; div ax (the total bytes) by num of bytes(10) 
      mov [mone],ax     ; mone gets the portion
      mov [sherit],dx   ; mone gets the remainder  
      ret
endp getANumber
;----------------------------------------------------------------- 
; the function close the open file
proc CloseFile
    mov ah,3Eh
    mov bx,[filehandle]
    int 21h   ; close the file
    ret
endp CloseFile

end

