; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @temperatureToColor(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  %7 = load i32, ptr %2, align 4
  store i32 %7, ptr %6, align 4
  %8 = load i32, ptr %6, align 4
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  store i32 0, ptr %6, align 4
  br label %11

11:                                               ; preds = %10, %1
  %12 = load i32, ptr %6, align 4
  %13 = icmp sgt i32 %12, 1024
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  store i32 1024, ptr %6, align 4
  br label %15

15:                                               ; preds = %14, %11
  %16 = load i32, ptr %6, align 4
  %17 = icmp slt i32 %16, 256
  br i1 %17, label %18, label %20

18:                                               ; preds = %15
  %19 = load i32, ptr %6, align 4
  store i32 %19, ptr %5, align 4
  br label %44

20:                                               ; preds = %15
  %21 = load i32, ptr %6, align 4
  %22 = icmp slt i32 %21, 512
  br i1 %22, label %23, label %26

23:                                               ; preds = %20
  %24 = load i32, ptr %6, align 4
  %25 = sub nsw i32 %24, 256
  store i32 %25, ptr %4, align 4
  store i32 255, ptr %5, align 4
  br label %43

26:                                               ; preds = %20
  %27 = load i32, ptr %6, align 4
  %28 = icmp slt i32 %27, 768
  br i1 %28, label %29, label %35

29:                                               ; preds = %26
  %30 = load i32, ptr %6, align 4
  %31 = sub nsw i32 %30, 512
  store i32 %31, ptr %3, align 4
  store i32 255, ptr %4, align 4
  %32 = load i32, ptr %6, align 4
  %33 = sub nsw i32 %32, 512
  %34 = sub nsw i32 255, %33
  store i32 %34, ptr %5, align 4
  br label %42

35:                                               ; preds = %26
  store i32 255, ptr %3, align 4
  %36 = load i32, ptr %6, align 4
  %37 = sub nsw i32 1024, %36
  store i32 %37, ptr %4, align 4
  %38 = load i32, ptr %4, align 4
  %39 = icmp sgt i32 %38, 255
  br i1 %39, label %40, label %41

40:                                               ; preds = %35
  store i32 255, ptr %4, align 4
  br label %41

41:                                               ; preds = %40, %35
  br label %42

42:                                               ; preds = %41, %29
  br label %43

43:                                               ; preds = %42, %23
  br label %44

44:                                               ; preds = %43, %18
  %45 = load i32, ptr %3, align 4
  %46 = shl i32 %45, 16
  %47 = or i32 -16777216, %46
  %48 = load i32, ptr %4, align 4
  %49 = shl i32 %48, 8
  %50 = or i32 %47, %49
  %51 = load i32, ptr %5, align 4
  %52 = or i32 %50, %51
  ret i32 %52
}

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
define dso_local void @drawField(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %28, %1
  %6 = load i32, ptr %4, align 4
  %7 = icmp slt i32 %6, 192
  br i1 %7, label %8, label %31

8:                                                ; preds = %5
  store i32 0, ptr %3, align 4
  br label %9

9:                                                ; preds = %24, %8
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %10, 384
  br i1 %11, label %12, label %27

12:                                               ; preds = %9
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %4, align 4
  %15 = load ptr, ptr %2, align 8
  %16 = load i32, ptr %4, align 4
  %17 = mul nsw i32 %16, 384
  %18 = load i32, ptr %3, align 4
  %19 = add nsw i32 %17, %18
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %15, i64 %20
  %22 = load i32, ptr %21, align 4
  %23 = call i32 @temperatureToColor(i32 noundef %22)
  call void @drawCell(i32 noundef %13, i32 noundef %14, i32 noundef %23)
  br label %24

24:                                               ; preds = %12
  %25 = load i32, ptr %3, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %3, align 4
  br label %9, !llvm.loop !6

27:                                               ; preds = %9
  br label %28

28:                                               ; preds = %27
  %29 = load i32, ptr %4, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %4, align 4
  br label %5, !llvm.loop !8

31:                                               ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @setSource(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 -8, ptr %8, align 4
  br label %13

13:                                               ; preds = %67, %3
  %14 = load i32, ptr %8, align 4
  %15 = icmp sle i32 %14, 8
  br i1 %15, label %16, label %70

16:                                               ; preds = %13
  store i32 -8, ptr %7, align 4
  br label %17

17:                                               ; preds = %63, %16
  %18 = load i32, ptr %7, align 4
  %19 = icmp sle i32 %18, 8
  br i1 %19, label %20, label %66

20:                                               ; preds = %17
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %7, align 4
  %23 = mul nsw i32 %21, %22
  %24 = load i32, ptr %8, align 4
  %25 = load i32, ptr %8, align 4
  %26 = mul nsw i32 %24, %25
  %27 = add nsw i32 %23, %26
  store i32 %27, ptr %11, align 4
  %28 = load i32, ptr %11, align 4
  %29 = icmp sle i32 %28, 64
  br i1 %29, label %30, label %62

30:                                               ; preds = %20
  %31 = load i32, ptr %5, align 4
  %32 = load i32, ptr %7, align 4
  %33 = add nsw i32 %31, %32
  store i32 %33, ptr %9, align 4
  %34 = load i32, ptr %6, align 4
  %35 = load i32, ptr %8, align 4
  %36 = add nsw i32 %34, %35
  store i32 %36, ptr %10, align 4
  %37 = load i32, ptr %9, align 4
  %38 = icmp sge i32 %37, 0
  br i1 %38, label %39, label %61

39:                                               ; preds = %30
  %40 = load i32, ptr %9, align 4
  %41 = icmp slt i32 %40, 384
  br i1 %41, label %42, label %61

42:                                               ; preds = %39
  %43 = load i32, ptr %10, align 4
  %44 = icmp sge i32 %43, 0
  br i1 %44, label %45, label %61

45:                                               ; preds = %42
  %46 = load i32, ptr %10, align 4
  %47 = icmp slt i32 %46, 192
  br i1 %47, label %48, label %61

48:                                               ; preds = %45
  %49 = load i32, ptr %11, align 4
  %50 = mul nsw i32 %49, 1024
  %51 = sdiv i32 %50, 65
  %52 = sub nsw i32 1024, %51
  store i32 %52, ptr %12, align 4
  %53 = load i32, ptr %12, align 4
  %54 = load ptr, ptr %4, align 8
  %55 = load i32, ptr %10, align 4
  %56 = mul nsw i32 %55, 384
  %57 = load i32, ptr %9, align 4
  %58 = add nsw i32 %56, %57
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, ptr %54, i64 %59
  store i32 %53, ptr %60, align 4
  br label %61

61:                                               ; preds = %48, %45, %42, %39, %30
  br label %62

62:                                               ; preds = %61, %20
  br label %63

63:                                               ; preds = %62
  %64 = load i32, ptr %7, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %7, align 4
  br label %17, !llvm.loop !9

66:                                               ; preds = %17
  br label %67

67:                                               ; preds = %66
  %68 = load i32, ptr %8, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %8, align 4
  br label %13, !llvm.loop !10

70:                                               ; preds = %13
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @clearField(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %12, %1
  %5 = load i32, ptr %3, align 4
  %6 = icmp slt i32 %5, 73728
  br i1 %6, label %7, label %15

7:                                                ; preds = %4
  %8 = load ptr, ptr %2, align 8
  %9 = load i32, ptr %3, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i32, ptr %8, i64 %10
  store i32 0, ptr %11, align 4
  br label %12

12:                                               ; preds = %7
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, ptr %3, align 4
  br label %4, !llvm.loop !11

15:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @app() #0 {
  %1 = alloca [73728 x i32], align 16
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %1, i8 0, i64 294912, i1 false)
  store i32 0, ptr %2, align 4
  store i32 96, ptr %4, align 4
  br label %5

5:                                                ; preds = %0, %5
  %6 = getelementptr inbounds [73728 x i32], ptr %1, i64 0, i64 0
  call void @clearField(ptr noundef %6)
  %7 = load i32, ptr %2, align 4
  %8 = srem i32 %7, 352
  %9 = add nsw i32 16, %8
  store i32 %9, ptr %3, align 4
  %10 = getelementptr inbounds [73728 x i32], ptr %1, i64 0, i64 0
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %4, align 4
  call void @setSource(ptr noundef %10, i32 noundef %11, i32 noundef %12)
  %13 = getelementptr inbounds [73728 x i32], ptr %1, i64 0, i64 0
  call void @drawField(ptr noundef %13)
  call void (...) @simFlush()
  %14 = load i32, ptr %2, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %2, align 4
  br label %5
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #2

declare void @simFlush(...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: write) }

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
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
