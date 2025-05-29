
; ModuleID = 'main'
source_filename = "main"

define i32 @main() {
entry:
  %i = alloca i32, align 4
  %calltmp = call i32 @default-1n-method-2p-float-int(float 0x3FB99999A0000000, i32 2)
  %calltmp1 = call i32 @default-1n-method-2p-int-float(i32 10, float 0x3FB99999A0000000)
  %addtmp = add i32 %calltmp1, %calltmp
  store i32 %addtmp, ptr %i, align 4
  br label %while

whilecond:                                        ; preds = %while
  %i2 = load i32, ptr %i, align 4
  %gttmp = icmp sgt i32 %i2, 5
  br i1 %gttmp, label %while, label %endwhile

while:                                            ; preds = %whilecond, %entry
  %i3 = load i32, ptr %i, align 4
  %subtmp = sub i32 %i3, 1
  store i32 %subtmp, ptr %i, align 4
  br label %endwhile
  %i4 = load i32, ptr %i, align 4
  %subtmp5 = sub i32 %i4, 65
  store i32 %subtmp5, ptr %i, align 4
  br label %whilecond

endwhile:                                         ; preds = %while, %whilecond
  %i6 = load i32, ptr %i, align 4
  ret i32 %i6
}

define i32 @default-1n-method-2p-int-float(i32 %b, float %j) {
entry:
  %j2 = alloca float, align 4
  %b1 = alloca i32, align 4
  store i32 %b, ptr %b1, align 4
  store float %j, ptr %j2, align 4
  %b3 = load i32, ptr %b1, align 4
  %addtmp = add i32 %b3, 50
  ret i32 %addtmp
}

define i32 @default-1n-method-2p-float-int(float %a, i32 %b) {
entry:
  %b2 = alloca i32, align 4
  %a1 = alloca float, align 4
  store float %a, ptr %a1, align 4
  store i32 %b, ptr %b2, align 4
  %b3 = load i32, ptr %b2, align 4
  %addtmp = add i32 %b3, 2
  ret i32 %addtmp
}


