
; ModuleID = 'main'
source_filename = "main"

define i32 @main(i32 %balls) {
entry:
  %p = alloca i32, align 4
  %not_b = alloca i1, align 1
  %b = alloca i1, align 1
  %jaws = alloca i32, align 4
  %i = alloca i32, align 4
  %balls1 = alloca i32, align 4
  store i32 %balls, ptr %balls1, align 4
  store i32 2123504, ptr %i, align 4
  %i2 = load i32, ptr %i, align 4
  %balls3 = load i32, ptr %balls1, align 4
  %addtmp = add i32 %balls3, %i2
  store i32 %addtmp, ptr %jaws, align 4
  %i4 = load i32, ptr %i, align 4
  %addtmp5 = add i32 %i4, 1
  %i6 = load i32, ptr %i, align 4
  %lttmp = icmp slt i32 %i6, %addtmp5
  store i1 %lttmp, ptr %b, align 1
  %b7 = load i1, ptr %b, align 1
  %nottmp = xor i1 %b7, true
  store i1 %nottmp, ptr %not_b, align 1
  %jaws8 = load i32, ptr %jaws, align 4
  store i32 %jaws8, ptr %p, align 4
  ret i32 0
}


