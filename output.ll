
; ModuleID = 'main'
source_filename = "main"

%A = type { i32 }
%B = type {}

define i32 @B-1n-Main-2p() {
entry:
  %j4 = alloca %A, align 8
  %j3 = alloca %A, align 8
  %j = alloca %A, align 8
  store %A zeroinitializer, ptr %j, align 4
  store %A zeroinitializer, ptr %j, align 4
  %calltmp = call %A @A-1n-StaticMethod-2p-c_B(%B zeroinitializer)
  store %A %calltmp, ptr %j3, align 4
  %calltmp1 = call %A @A-1n-StaticMethod-2p-c_A(%A zeroinitializer)
  store %A %calltmp1, ptr %j4, align 4
  ret i32 10
}

define i32 @A-1n-Main-2p() {
entry:
  %j = alloca %A, align 8
  %b = alloca %B, align 8
  %i = alloca i32, align 4
  store i32 120, ptr %i, align 4
  store %B zeroinitializer, ptr %b, align 1
  %b1 = load %B, ptr %b, align 1
  %calltmp = call %A @A-1n-StaticMethod-2p-c_B(%B %b1)
  store %A %calltmp, ptr %j, align 4
  %i2 = load i32, ptr %i, align 4
  ret i32 %i2
}

define %A @A-1n-StaticMethod-2p-c_B(%B %b) {
entry:
  %b1 = alloca %B, align 8
  store %B %b, ptr %b1, align 1
  ret %A zeroinitializer
}

define %A @A-1n-StaticMethod-2p-c_A(%A %a) {
entry:
  %a1 = alloca %A, align 8
  store %A %a, ptr %a1, align 4
  ret %A zeroinitializer
}

define i32 @main() {
entry:
  %calltmp = call i32 @A-1n-Main-2p()
  %calltmp1 = call i32 @B-1n-Main-2p()
  ret i32 0
}


