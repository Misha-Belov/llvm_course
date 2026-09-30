; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @waveToColor(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 8, ptr %3, align 4
  store i32 35, ptr %4, align 4
  store i32 75, ptr %5, align 4
  %7 = load i32, ptr %2, align 4
  store i32 %7, ptr %6, align 4
  %8 = load i32, ptr %6, align 4
  %9 = icmp sgt i32 %8, 2048
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  store i32 2048, ptr %6, align 4
  br label %11

11:                                               ; preds = %10, %1
  %12 = load i32, ptr %6, align 4
  %13 = icmp slt i32 %12, -2048
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  store i32 -2048, ptr %6, align 4
  br label %15

15:                                               ; preds = %14, %11
  %16 = load i32, ptr %6, align 4
  %17 = icmp sge i32 %16, 0
  br i1 %17, label %18, label %34

18:                                               ; preds = %15
  %19 = load i32, ptr %6, align 4
  %20 = mul nsw i32 %19, 70
  %21 = sdiv i32 %20, 2048
  %22 = load i32, ptr %3, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %3, align 4
  %24 = load i32, ptr %6, align 4
  %25 = mul nsw i32 %24, 180
  %26 = sdiv i32 %25, 2048
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %4, align 4
  %29 = load i32, ptr %6, align 4
  %30 = mul nsw i32 %29, 180
  %31 = sdiv i32 %30, 2048
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %5, align 4
  br label %52

34:                                               ; preds = %15
  %35 = load i32, ptr %6, align 4
  %36 = sub nsw i32 0, %35
  store i32 %36, ptr %6, align 4
  %37 = load i32, ptr %6, align 4
  %38 = mul nsw i32 %37, 6
  %39 = sdiv i32 %38, 2048
  %40 = load i32, ptr %3, align 4
  %41 = sub nsw i32 %40, %39
  store i32 %41, ptr %3, align 4
  %42 = load i32, ptr %6, align 4
  %43 = mul nsw i32 %42, 25
  %44 = sdiv i32 %43, 2048
  %45 = load i32, ptr %4, align 4
  %46 = sub nsw i32 %45, %44
  store i32 %46, ptr %4, align 4
  %47 = load i32, ptr %6, align 4
  %48 = mul nsw i32 %47, 45
  %49 = sdiv i32 %48, 2048
  %50 = load i32, ptr %5, align 4
  %51 = sub nsw i32 %50, %49
  store i32 %51, ptr %5, align 4
  br label %52

52:                                               ; preds = %34, %18
  %53 = load i32, ptr %3, align 4
  %54 = shl i32 %53, 16
  %55 = or i32 -16777216, %54
  %56 = load i32, ptr %4, align 4
  %57 = shl i32 %56, 8
  %58 = or i32 %55, %57
  %59 = load i32, ptr %5, align 4
  %60 = or i32 %58, %59
  ret i32 %60
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
  br label %4, !llvm.loop !6

15:                                               ; preds = %4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @addDrop(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 36, ptr %14, align 4
  store i32 -6, ptr %10, align 4
  br label %16

16:                                               ; preds = %77, %4
  %17 = load i32, ptr %10, align 4
  %18 = icmp sle i32 %17, 6
  br i1 %18, label %19, label %80

19:                                               ; preds = %16
  store i32 -6, ptr %9, align 4
  br label %20

20:                                               ; preds = %73, %19
  %21 = load i32, ptr %9, align 4
  %22 = icmp sle i32 %21, 6
  br i1 %22, label %23, label %76

23:                                               ; preds = %20
  %24 = load i32, ptr %9, align 4
  %25 = load i32, ptr %9, align 4
  %26 = mul nsw i32 %24, %25
  %27 = load i32, ptr %10, align 4
  %28 = load i32, ptr %10, align 4
  %29 = mul nsw i32 %27, %28
  %30 = add nsw i32 %26, %29
  store i32 %30, ptr %13, align 4
  %31 = load i32, ptr %13, align 4
  %32 = load i32, ptr %14, align 4
  %33 = icmp sle i32 %31, %32
  br i1 %33, label %34, label %72

34:                                               ; preds = %23
  %35 = load i32, ptr %6, align 4
  %36 = load i32, ptr %9, align 4
  %37 = add nsw i32 %35, %36
  store i32 %37, ptr %11, align 4
  %38 = load i32, ptr %7, align 4
  %39 = load i32, ptr %10, align 4
  %40 = add nsw i32 %38, %39
  store i32 %40, ptr %12, align 4
  %41 = load i32, ptr %11, align 4
  %42 = icmp sgt i32 %41, 0
  br i1 %42, label %43, label %71

43:                                               ; preds = %34
  %44 = load i32, ptr %11, align 4
  %45 = icmp slt i32 %44, 383
  br i1 %45, label %46, label %71

46:                                               ; preds = %43
  %47 = load i32, ptr %12, align 4
  %48 = icmp sgt i32 %47, 0
  br i1 %48, label %49, label %71

49:                                               ; preds = %46
  %50 = load i32, ptr %12, align 4
  %51 = icmp slt i32 %50, 191
  br i1 %51, label %52, label %71

52:                                               ; preds = %49
  %53 = load i32, ptr %8, align 4
  %54 = load i32, ptr %14, align 4
  %55 = load i32, ptr %13, align 4
  %56 = sub nsw i32 %54, %55
  %57 = mul nsw i32 %53, %56
  %58 = load i32, ptr %14, align 4
  %59 = add nsw i32 %58, 1
  %60 = sdiv i32 %57, %59
  store i32 %60, ptr %15, align 4
  %61 = load i32, ptr %15, align 4
  %62 = load ptr, ptr %5, align 8
  %63 = load i32, ptr %12, align 4
  %64 = mul nsw i32 %63, 384
  %65 = load i32, ptr %11, align 4
  %66 = add nsw i32 %64, %65
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, ptr %62, i64 %67
  %69 = load i32, ptr %68, align 4
  %70 = add nsw i32 %69, %61
  store i32 %70, ptr %68, align 4
  br label %71

71:                                               ; preds = %52, %49, %46, %43, %34
  br label %72

72:                                               ; preds = %71, %23
  br label %73

73:                                               ; preds = %72
  %74 = load i32, ptr %9, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %9, align 4
  br label %20, !llvm.loop !8

76:                                               ; preds = %20
  br label %77

77:                                               ; preds = %76
  %78 = load i32, ptr %10, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, ptr %10, align 4
  br label %16, !llvm.loop !9

80:                                               ; preds = %16
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @stepWave(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %11

11:                                               ; preds = %24, %3
  %12 = load i32, ptr %7, align 4
  %13 = icmp slt i32 %12, 384
  br i1 %13, label %14, label %27

14:                                               ; preds = %11
  %15 = load ptr, ptr %6, align 8
  %16 = load i32, ptr %7, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr %15, i64 %17
  store i32 0, ptr %18, align 4
  %19 = load ptr, ptr %6, align 8
  %20 = load i32, ptr %7, align 4
  %21 = add nsw i32 73344, %20
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, ptr %19, i64 %22
  store i32 0, ptr %23, align 4
  br label %24

24:                                               ; preds = %14
  %25 = load i32, ptr %7, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %7, align 4
  br label %11, !llvm.loop !10

27:                                               ; preds = %11
  store i32 0, ptr %8, align 4
  br label %28

28:                                               ; preds = %44, %27
  %29 = load i32, ptr %8, align 4
  %30 = icmp slt i32 %29, 192
  br i1 %30, label %31, label %47

31:                                               ; preds = %28
  %32 = load ptr, ptr %6, align 8
  %33 = load i32, ptr %8, align 4
  %34 = mul nsw i32 %33, 384
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, ptr %32, i64 %35
  store i32 0, ptr %36, align 4
  %37 = load ptr, ptr %6, align 8
  %38 = load i32, ptr %8, align 4
  %39 = mul nsw i32 %38, 384
  %40 = add nsw i32 %39, 384
  %41 = sub nsw i32 %40, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, ptr %37, i64 %42
  store i32 0, ptr %43, align 4
  br label %44

44:                                               ; preds = %31
  %45 = load i32, ptr %8, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %8, align 4
  br label %28, !llvm.loop !11

47:                                               ; preds = %28
  store i32 1, ptr %8, align 4
  br label %48

48:                                               ; preds = %106, %47
  %49 = load i32, ptr %8, align 4
  %50 = icmp slt i32 %49, 191
  br i1 %50, label %51, label %109

51:                                               ; preds = %48
  store i32 1, ptr %7, align 4
  br label %52

52:                                               ; preds = %102, %51
  %53 = load i32, ptr %7, align 4
  %54 = icmp slt i32 %53, 383
  br i1 %54, label %55, label %105

55:                                               ; preds = %52
  %56 = load i32, ptr %8, align 4
  %57 = mul nsw i32 %56, 384
  %58 = load i32, ptr %7, align 4
  %59 = add nsw i32 %57, %58
  store i32 %59, ptr %9, align 4
  %60 = load ptr, ptr %5, align 8
  %61 = load i32, ptr %9, align 4
  %62 = sub nsw i32 %61, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, ptr %60, i64 %63
  %65 = load i32, ptr %64, align 4
  %66 = load ptr, ptr %5, align 8
  %67 = load i32, ptr %9, align 4
  %68 = add nsw i32 %67, 1
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i32, ptr %66, i64 %69
  %71 = load i32, ptr %70, align 4
  %72 = add nsw i32 %65, %71
  %73 = load ptr, ptr %5, align 8
  %74 = load i32, ptr %9, align 4
  %75 = sub nsw i32 %74, 384
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, ptr %73, i64 %76
  %78 = load i32, ptr %77, align 4
  %79 = add nsw i32 %72, %78
  %80 = load ptr, ptr %5, align 8
  %81 = load i32, ptr %9, align 4
  %82 = add nsw i32 %81, 384
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, ptr %80, i64 %83
  %85 = load i32, ptr %84, align 4
  %86 = add nsw i32 %79, %85
  %87 = sdiv i32 %86, 2
  %88 = load ptr, ptr %4, align 8
  %89 = load i32, ptr %9, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, ptr %88, i64 %90
  %92 = load i32, ptr %91, align 4
  %93 = sub nsw i32 %87, %92
  store i32 %93, ptr %10, align 4
  %94 = load i32, ptr %10, align 4
  %95 = mul nsw i32 %94, 998
  %96 = sdiv i32 %95, 1000
  store i32 %96, ptr %10, align 4
  %97 = load i32, ptr %10, align 4
  %98 = load ptr, ptr %6, align 8
  %99 = load i32, ptr %9, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, ptr %98, i64 %100
  store i32 %97, ptr %101, align 4
  br label %102

102:                                              ; preds = %55
  %103 = load i32, ptr %7, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, ptr %7, align 4
  br label %52, !llvm.loop !12

105:                                              ; preds = %52
  br label %106

106:                                              ; preds = %105
  %107 = load i32, ptr %8, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, ptr %8, align 4
  br label %48, !llvm.loop !13

109:                                              ; preds = %48
  ret void
}

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
  %23 = call i32 @waveToColor(i32 noundef %22)
  call void @drawCell(i32 noundef %13, i32 noundef %14, i32 noundef %23)
  br label %24

24:                                               ; preds = %12
  %25 = load i32, ptr %3, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %3, align 4
  br label %9, !llvm.loop !14

27:                                               ; preds = %9
  br label %28

28:                                               ; preds = %27
  %29 = load i32, ptr %4, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %4, align 4
  br label %5, !llvm.loop !15

31:                                               ; preds = %5
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @app() #0 {
  %1 = alloca [73728 x i32], align 16
  %2 = alloca [73728 x i32], align 16
  %3 = alloca [73728 x i32], align 16
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = getelementptr inbounds [73728 x i32], ptr %1, i64 0, i64 0
  store ptr %8, ptr %4, align 8
  %9 = getelementptr inbounds [73728 x i32], ptr %2, i64 0, i64 0
  store ptr %9, ptr %5, align 8
  %10 = getelementptr inbounds [73728 x i32], ptr %3, i64 0, i64 0
  store ptr %10, ptr %6, align 8
  %11 = load ptr, ptr %4, align 8
  call void @clearField(ptr noundef %11)
  %12 = load ptr, ptr %5, align 8
  call void @clearField(ptr noundef %12)
  %13 = load ptr, ptr %6, align 8
  call void @clearField(ptr noundef %13)
  %14 = load ptr, ptr %4, align 8
  call void @addDrop(ptr noundef %14, i32 noundef 192, i32 noundef 96, i32 noundef 1800)
  %15 = load ptr, ptr %5, align 8
  call void @addDrop(ptr noundef %15, i32 noundef 192, i32 noundef 96, i32 noundef 1800)
  br label %16

16:                                               ; preds = %0, %16
  %17 = load ptr, ptr %5, align 8
  call void @drawField(ptr noundef %17)
  call void (...) @simFlush()
  %18 = load ptr, ptr %4, align 8
  %19 = load ptr, ptr %5, align 8
  %20 = load ptr, ptr %6, align 8
  call void @stepWave(ptr noundef %18, ptr noundef %19, ptr noundef %20)
  %21 = load ptr, ptr %4, align 8
  store ptr %21, ptr %7, align 8
  %22 = load ptr, ptr %5, align 8
  store ptr %22, ptr %4, align 8
  %23 = load ptr, ptr %6, align 8
  store ptr %23, ptr %5, align 8
  %24 = load ptr, ptr %7, align 8
  store ptr %24, ptr %6, align 8
  br label %16
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
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
