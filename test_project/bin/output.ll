
; ModuleID = 'main'
source_filename = "main"

%A = type { %B, i32 }
%B = type { i32 }

define void @B-constructor(ptr %this) {
entry:
  ret void
}

define i32 @B-n-Main() {
entry:
  ret i32 10
}

define i32 @A-n-Main() {
entry:
  ret i32 0
}

define void @A-constructor-p-int(ptr %this, i32 %jaws) {
entry:
  %jaws1 = alloca i32, align 4
  store i32 %jaws, ptr %jaws1, align 4
  %AnumJaws = getelementptr inbounds %A, ptr %this, i32 0, i32 1
  %jaws2 = load i32, ptr %jaws1, align 4
  store i32 %jaws2, ptr %AnumJaws, align 4
  %AtheB = getelementptr inbounds %A, ptr %this, i32 0, i32 0
  call void @B-constructor()
  store %B { i32 1203 }, ptr %AtheB, align 4
  ret void
}

define void @A-n-InstanceMethodA(ptr %this) {
entry:
  call void @A-n-InstanceMethodB(ptr %this)
  ret void
}

define void @A-n-InstanceMethodB(ptr %this) {
entry:
  %AnumJaws = getelementptr inbounds %A, ptr %this, i32 0, i32 1
  store i32 12003, ptr %AnumJaws, align 4
  ret void
}

define i32 @main() {
entry:
  %calltmp = call i32 @A-n-Main()
  %calltmp1 = call i32 @B-n-Main()
  ret i32 0
}


