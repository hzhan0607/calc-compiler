target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %Mutable0 = alloca i64
  store i64 0, i64* %Mutable0
  %Mutable1 = alloca i64
  store i64 0, i64* %Mutable1
  %Mutable2 = alloca i64
  store i64 0, i64* %Mutable2
  %Mutable3 = alloca i64
  store i64 0, i64* %Mutable3
  %Mutable4 = alloca i64
  store i64 0, i64* %Mutable4
  %Mutable5 = alloca i64
  store i64 0, i64* %Mutable5
  %Mutable6 = alloca i64
  store i64 0, i64* %Mutable6
  %Mutable7 = alloca i64
  store i64 0, i64* %Mutable7
  %Mutable8 = alloca i64
  store i64 0, i64* %Mutable8
  %Mutable9 = alloca i64
  store i64 0, i64* %Mutable9
  %6 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 4)
  %7 = extractvalue { i64, i1 } %6, 0
  %8 = extractvalue { i64, i1 } %6, 1
  br i1 %8, label %then, label %else

then:                                             ; preds = %entry
  %calltrap = call i64 @overflow_fail(i64 36)
  br label %else

else:                                             ; preds = %then, %entry
  %9 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 4, i64 4)
  %10 = extractvalue { i64, i1 } %9, 0
  %11 = extractvalue { i64, i1 } %9, 1
  br i1 %11, label %then1, label %else3

then1:                                            ; preds = %else
  %calltrap2 = call i64 @overflow_fail(i64 55)
  br label %else3

else3:                                            ; preds = %then1, %else
  %12 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %10, i64 4)
  %13 = extractvalue { i64, i1 } %12, 0
  %14 = extractvalue { i64, i1 } %12, 1
  br i1 %14, label %then4, label %else6

then4:                                            ; preds = %else3
  %calltrap5 = call i64 @overflow_fail(i64 50)
  br label %else6

else6:                                            ; preds = %then4, %else3
  %15 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %7, i64 %13)
  %16 = extractvalue { i64, i1 } %15, 0
  %17 = extractvalue { i64, i1 } %15, 1
  br i1 %17, label %then7, label %else9

then7:                                            ; preds = %else6
  %calltrap8 = call i64 @overflow_fail(i64 33)
  br label %else9

else9:                                            ; preds = %then7, %else6
  %18 = call { i64, i1 } @llvm.smul.with.overflow.i64(i64 %16, i64 4)
  %19 = extractvalue { i64, i1 } %18, 0
  %20 = extractvalue { i64, i1 } %18, 1
  br i1 %20, label %then10, label %else12

then10:                                           ; preds = %else9
  %calltrap11 = call i64 @overflow_fail(i64 26)
  br label %else12

else12:                                           ; preds = %then10, %else9
  ret i64 %19
}

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64) #0

declare i64 @overflow_fail(i64)

attributes #0 = { nounwind readnone }
