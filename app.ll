; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawCell(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = mul nsw i32 %9, 4
  %11 = add nsw i32 %10, 1
  store i32 %11, ptr %7, align 4
  %12 = load i32, ptr %5, align 4
  %13 = mul nsw i32 %12, 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %8, align 4
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %6, align 4
  call void @simPutPixel(i32 noundef %15, i32 noundef %16, i32 noundef %17)
  %18 = load i32, ptr %7, align 4
  %19 = add nsw i32 %18, 1
  %20 = load i32, ptr %8, align 4
  %21 = load i32, ptr %6, align 4
  call void @simPutPixel(i32 noundef %19, i32 noundef %20, i32 noundef %21)
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %8, align 4
  %24 = add nsw i32 %23, 1
  %25 = load i32, ptr %6, align 4
  call void @simPutPixel(i32 noundef %22, i32 noundef %24, i32 noundef %25)
  %26 = load i32, ptr %7, align 4
  %27 = add nsw i32 %26, 1
  %28 = load i32, ptr %8, align 4
  %29 = add nsw i32 %28, 1
  %30 = load i32, ptr %6, align 4
  call void @simPutPixel(i32 noundef %27, i32 noundef %29, i32 noundef %30)
  ret void
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @app() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  br label %5

5:                                                ; preds = %0, %33
  %6 = load i32, ptr %1, align 4
  %7 = srem i32 %6, 384
  store i32 %7, ptr %4, align 4
  store i32 0, ptr %3, align 4
  br label %8

8:                                                ; preds = %30, %5
  %9 = load i32, ptr %3, align 4
  %10 = icmp slt i32 %9, 192
  br i1 %10, label %11, label %33

11:                                               ; preds = %8
  store i32 0, ptr %2, align 4
  br label %12

12:                                               ; preds = %26, %11
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %13, 384
  br i1 %14, label %15, label %29

15:                                               ; preds = %12
  %16 = load i32, ptr %2, align 4
  %17 = load i32, ptr %4, align 4
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %19, label %22

19:                                               ; preds = %15
  %20 = load i32, ptr %2, align 4
  %21 = load i32, ptr %3, align 4
  call void @drawCell(i32 noundef %20, i32 noundef %21, i32 noundef -65536)
  br label %25

22:                                               ; preds = %15
  %23 = load i32, ptr %2, align 4
  %24 = load i32, ptr %3, align 4
  call void @drawCell(i32 noundef %23, i32 noundef %24, i32 noundef -16777216)
  br label %25

25:                                               ; preds = %22, %19
  br label %26

26:                                               ; preds = %25
  %27 = load i32, ptr %2, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %2, align 4
  br label %12, !llvm.loop !6

29:                                               ; preds = %12
  br label %30

30:                                               ; preds = %29
  %31 = load i32, ptr %3, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %3, align 4
  br label %8, !llvm.loop !8

33:                                               ; preds = %8
  call void (...) @simFlush()
  %34 = load i32, ptr %1, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %1, align 4
  br label %5
}

declare void @simFlush(...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
