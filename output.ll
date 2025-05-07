
; ModuleID = 'main'
source_filename = "main"

define i32 @main() {
entry:
  %a = alloca i32, align 4
  store i32 120, ptr %a, align 4
  %a1 = load i32, ptr %a, align 4
  %subtmp = sub i32 %a1, 5
  store i32 %subtmp, ptr %a, align 4
  %a2 = load i32, ptr %a, align 4
  ret i32 %a2
}


