
; ModuleID = 'main'
source_filename = "main"

%A = type { %B, i32 }
%B = type { i32 }

define i32 @B-1n-Main-2p() {
entry:
  %j5 = alloca %A, align 8
  %i = alloca i32, align 4
  store i32 0, ptr %i, align 4
  %i1 = load i32, ptr %i, align 4
  %addtmp = add i32 %i1, 1
  store i32 %addtmp, ptr %i, align 4
  store %A zeroinitializer, ptr %j5, align 4
  call void @A-1n-InstanceMethod-2p-int(ptr %j5, i32 1203)
  ret i32 10
}

define i32 @A-1n-Main-2p() {
entry:
  ret i32 0
}

define void @A-1n-Test-2p-int(i32 %number) {
entry:
  %number1 = alloca i32, align 4
  store i32 %number, ptr %number1, align 4
  %number2 = load i32, ptr %number1, align 4
  %tmppostincr = add i32 %number2, 1
  store i32 %tmppostincr, ptr %number1, align 4
  ret void
}

define void @A-1n-InstanceMethod-2p-int(ptr %this, i32 %a) {
entry:
  %a1 = alloca i32, align 4
  store i32 %a, ptr %a1, align 4
  %AnumJaws = getelementptr inbounds %A, ptr %this, i32 0, i32 1
  %a2 = load i32, ptr %a1, align 4
  store i32 %a2, ptr %AnumJaws, align 4
  %AnumJaws3 = getelementptr inbounds %A, ptr %this, i32 0, i32 1
  %a4 = load i32, ptr %a1, align 4
  %addtmp = add i32 %a4, 12
  store i32 %addtmp, ptr %AnumJaws3, align 4
  ret void
}

define i32 @main() {
entry:
  %calltmp = call i32 @A-1n-Main-2p()
  %calltmp1 = call i32 @B-1n-Main-2p()
  ret i32 0
}


