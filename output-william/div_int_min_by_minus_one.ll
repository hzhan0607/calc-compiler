; ModuleID = 'calc'
source_filename = "calc"
target triple = "x86_64-unknown-linux-gnu"

declare { i64, i1 } @llvm.sadd.with.overflow.i64(i64, i64)

declare { i64, i1 } @llvm.ssub.with.overflow.i64(i64, i64)

declare { i64, i1 } @llvm.smul.with.overflow.i64(i64, i64)

declare void @overflow_fail(i64)

define i64 @f(i64, i64, i64, i64, i64, i64) {
entry:
  %6 = alloca i64
  store i64 0, i64* %6
  %7 = alloca i64
  store i64 0, i64* %7
  %8 = alloca i64
  store i64 0, i64* %8
  %9 = alloca i64
  store i64 0, i64* %9
  %10 = alloca i64
  store i64 0, i64* %10
  %11 = alloca i64
  store i64 0, i64* %11
  %12 = alloca i64
  store i64 0, i64* %12
  %13 = alloca i64
  store i64 0, i64* %13
  %14 = alloca i64
  store i64 0, i64* %14
  %15 = alloca i64
  store i64 0, i64* %15
  %"==" = icmp eq i64 -1, 0
  %"==1" = icmp eq i64 -1, -1
  %"==2" = icmp eq i64 -9223372036854775808, -9223372036854775808
  %16 = and i1 %"==1", %"==2"
  %17 = or i1 %16, %"=="
  br i1 %17, label %error, label %noerror

error:                                            ; preds = %entry
  call void @overflow_fail(i64 37)
  ret i64 0

noerror:                                          ; preds = %entry
  %"/" = sdiv i64 -9223372036854775808, -1
  ret i64 %"/"
}
