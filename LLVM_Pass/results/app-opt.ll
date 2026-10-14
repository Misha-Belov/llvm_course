; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @waveToColor(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @llvm.smin.i32(i32 %0, i32 1000)
  %3 = tail call i32 @llvm.smax.i32(i32 %2, i32 -1000)
  %4 = icmp sgt i32 %0, -1
  br i1 %4, label %5, label %17

5:                                                ; preds = %1
  %6 = mul nuw nsw i32 %3, 245
  %7 = udiv i32 %6, 1000
  %8 = mul nuw nsw i32 %3, 235
  %9 = udiv i32 %8, 1000
  %10 = add nuw nsw i32 %9, 20
  %11 = mul nuw nsw i32 %3, 215
  %12 = udiv i32 %11, 1000
  %13 = add nuw nsw i32 %12, 40
  %14 = shl nuw nsw i32 %7, 16
  %15 = add nuw nsw i32 %14, 655360
  %16 = or i32 %15, -16777216
  br label %25

17:                                               ; preds = %1
  %18 = mul nsw i32 %3, -30
  %19 = udiv i32 %18, 1000
  %20 = add nuw nsw i32 %19, 10
  %21 = trunc i32 %3 to i16
  %22 = sdiv i16 %21, -10
  %23 = add nuw nsw i16 %22, 25
  %24 = zext nneg i16 %23 to i32
  br label %25

25:                                               ; preds = %17, %5
  %26 = phi i32 [ %16, %5 ], [ -16449536, %17 ]
  %27 = phi i32 [ %10, %5 ], [ %20, %17 ]
  %28 = phi i32 [ %13, %5 ], [ %24, %17 ]
  %29 = shl nuw nsw i32 %27, 8
  %30 = or i32 %29, %26
  %31 = or i32 %30, %28
  ret i32 %31
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local void @drawCell(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #2 {
  %4 = shl nsw i32 %0, 2
  %5 = or disjoint i32 %4, 1
  %6 = shl nsw i32 %1, 2
  %7 = or disjoint i32 %6, 1
  tail call void @simPutPixel(i32 noundef %5, i32 noundef %7, i32 noundef %2) #9
  %8 = or disjoint i32 %4, 2
  tail call void @simPutPixel(i32 noundef %8, i32 noundef %7, i32 noundef %2) #9
  %9 = or disjoint i32 %6, 2
  tail call void @simPutPixel(i32 noundef %5, i32 noundef %9, i32 noundef %2) #9
  tail call void @simPutPixel(i32 noundef %8, i32 noundef %9, i32 noundef %2) #9
  ret void
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local void @drawField(ptr nocapture noundef readonly %0) local_unnamed_addr #2 {
  br label %2

2:                                                ; preds = %1, %52
  %3 = phi i64 [ 0, %1 ], [ %53, %52 ]
  %4 = mul nuw nsw i64 %3, 384
  %5 = shl nuw nsw i64 %3, 2
  %6 = getelementptr i32, ptr %0, i64 %4
  %7 = trunc i64 %5 to i32
  %8 = or disjoint i32 %7, 1
  %9 = trunc i64 %5 to i32
  %10 = or disjoint i32 %9, 2
  br label %11

11:                                               ; preds = %2, %38
  %12 = phi i64 [ 0, %2 ], [ %50, %38 ]
  %13 = getelementptr i32, ptr %6, i64 %12
  %14 = load i32, ptr %13, align 4, !tbaa !5
  %15 = tail call i32 @llvm.smin.i32(i32 %14, i32 1000)
  %16 = tail call i32 @llvm.smax.i32(i32 %15, i32 -1000)
  %17 = icmp sgt i32 %14, -1
  br i1 %17, label %18, label %30

18:                                               ; preds = %11
  %19 = mul nuw nsw i32 %16, 245
  %20 = udiv i32 %19, 1000
  %21 = mul nuw nsw i32 %16, 235
  %22 = udiv i32 %21, 1000
  %23 = add nuw nsw i32 %22, 20
  %24 = mul nuw nsw i32 %16, 215
  %25 = udiv i32 %24, 1000
  %26 = add nuw nsw i32 %25, 40
  %27 = shl nuw nsw i32 %20, 16
  %28 = add nuw nsw i32 %27, 655360
  %29 = or i32 %28, -16777216
  br label %38

30:                                               ; preds = %11
  %31 = mul nsw i32 %16, -30
  %32 = udiv i32 %31, 1000
  %33 = add nuw nsw i32 %32, 10
  %34 = trunc i32 %16 to i16
  %35 = sdiv i16 %34, -10
  %36 = add nuw nsw i16 %35, 25
  %37 = zext nneg i16 %36 to i32
  br label %38

38:                                               ; preds = %18, %30
  %39 = phi i32 [ %29, %18 ], [ -16449536, %30 ]
  %40 = phi i32 [ %23, %18 ], [ %33, %30 ]
  %41 = phi i32 [ %26, %18 ], [ %37, %30 ]
  %42 = shl nuw nsw i32 %40, 8
  %43 = or i32 %42, %39
  %44 = or i32 %43, %41
  %45 = shl nuw nsw i64 %12, 2
  %46 = trunc i64 %45 to i32
  %47 = or disjoint i32 %46, 1
  tail call void @simPutPixel(i32 noundef %47, i32 noundef %8, i32 noundef %44) #9
  %48 = trunc i64 %45 to i32
  %49 = or disjoint i32 %48, 2
  tail call void @simPutPixel(i32 noundef %49, i32 noundef %8, i32 noundef %44) #9
  tail call void @simPutPixel(i32 noundef %47, i32 noundef %10, i32 noundef %44) #9
  tail call void @simPutPixel(i32 noundef %49, i32 noundef %10, i32 noundef %44) #9
  %50 = add nuw nsw i64 %12, 1
  %51 = icmp eq i64 %50, 384
  br i1 %51, label %52, label %11, !llvm.loop !9

52:                                               ; preds = %38
  %53 = add nuw nsw i64 %3, 1
  %54 = icmp eq i64 %53, 192
  br i1 %54, label %55, label %2, !llvm.loop !11

55:                                               ; preds = %52
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) uwtable
define dso_local void @clearField(ptr nocapture noundef writeonly %0) local_unnamed_addr #4 {
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(294912) %0, i8 0, i64 294912, i1 false), !tbaa !5
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @addSource(ptr nocapture noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #5 {
  br label %4

4:                                                ; preds = %3, %36
  %5 = phi i32 [ -6, %3 ], [ %37, %36 ]
  %6 = mul nsw i32 %5, %5
  %7 = add nsw i32 %5, %2
  %8 = icmp sgt i32 %7, 0
  %9 = icmp slt i32 %7, 191
  %10 = mul nuw nsw i32 %7, 384
  br label %11

11:                                               ; preds = %4, %33
  %12 = phi i32 [ -6, %4 ], [ %34, %33 ]
  %13 = mul nsw i32 %12, %12
  %14 = add nuw nsw i32 %13, %6
  %15 = icmp ult i32 %14, 37
  br i1 %15, label %16, label %33

16:                                               ; preds = %11
  %17 = add nsw i32 %12, %1
  %18 = add i32 %17, -1
  %19 = icmp ult i32 %18, 382
  %20 = select i1 %19, i1 %8, i1 false
  %21 = select i1 %20, i1 %9, i1 false
  br i1 %21, label %22, label %33

22:                                               ; preds = %16
  %23 = trunc i32 %14 to i16
  %24 = sub nuw nsw i16 36, %23
  %25 = mul nuw i16 %24, 1800
  %26 = udiv i16 %25, 37
  %27 = zext nneg i16 %26 to i32
  %28 = add nuw nsw i32 %17, %10
  %29 = zext nneg i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %0, i64 %29
  %31 = load i32, ptr %30, align 4, !tbaa !5
  %32 = add nsw i32 %31, %27
  store i32 %32, ptr %30, align 4, !tbaa !5
  br label %33

33:                                               ; preds = %11, %22, %16
  %34 = add nsw i32 %12, 1
  %35 = icmp eq i32 %34, 7
  br i1 %35, label %36, label %11, !llvm.loop !12

36:                                               ; preds = %33
  %37 = add nsw i32 %5, 1
  %38 = icmp eq i32 %37, 7
  br i1 %38, label %39, label %4, !llvm.loop !13

39:                                               ; preds = %36
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @randomX() local_unnamed_addr #2 {
  %1 = tail call i32 (...) @simRand() #9
  %2 = srem i32 %1, 368
  %3 = add nsw i32 %2, 8
  ret i32 %3
}

declare i32 @simRand(...) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local i32 @randomY() local_unnamed_addr #2 {
  %1 = tail call i32 (...) @simRand() #9
  %2 = srem i32 %1, 176
  %3 = add nsw i32 %2, 8
  ret i32 %3
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @stepWave(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1, ptr nocapture noundef writeonly %2) local_unnamed_addr #5 {
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(1536) %2, i8 0, i64 1536, i1 false), !tbaa !5
  %4 = getelementptr i8, ptr %2, i64 293376
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(1536) %4, i8 0, i64 1536, i1 false), !tbaa !5
  br label %5

5:                                                ; preds = %5, %3
  %6 = phi i64 [ 0, %3 ], [ %22, %5 ]
  %7 = mul nuw nsw i64 %6, 384
  %8 = getelementptr inbounds i32, ptr %2, i64 %7
  store i32 0, ptr %8, align 4, !tbaa !5
  %9 = getelementptr i32, ptr %8, i64 383
  store i32 0, ptr %9, align 4, !tbaa !5
  %10 = mul nuw i64 %6, 384
  %11 = or disjoint i64 %10, 384
  %12 = getelementptr inbounds i32, ptr %2, i64 %11
  store i32 0, ptr %12, align 4, !tbaa !5
  %13 = getelementptr i32, ptr %12, i64 383
  store i32 0, ptr %13, align 4, !tbaa !5
  %14 = mul nuw i64 %6, 384
  %15 = getelementptr i32, ptr %2, i64 %14
  %16 = getelementptr i32, ptr %15, i64 768
  store i32 0, ptr %16, align 4, !tbaa !5
  %17 = getelementptr i32, ptr %15, i64 1151
  store i32 0, ptr %17, align 4, !tbaa !5
  %18 = mul nuw i64 %6, 384
  %19 = getelementptr i32, ptr %2, i64 %18
  %20 = getelementptr i32, ptr %19, i64 1152
  store i32 0, ptr %20, align 4, !tbaa !5
  %21 = getelementptr i32, ptr %19, i64 1535
  store i32 0, ptr %21, align 4, !tbaa !5
  %22 = add nuw nsw i64 %6, 4
  %23 = icmp eq i64 %22, 192
  br i1 %23, label %24, label %5, !llvm.loop !14

24:                                               ; preds = %5
  %25 = getelementptr i8, ptr %2, i64 1540
  %26 = getelementptr i8, ptr %2, i64 293372
  %27 = getelementptr i8, ptr %1, i64 4
  %28 = getelementptr i8, ptr %1, i64 294908
  %29 = getelementptr i8, ptr %0, i64 1540
  %30 = getelementptr i8, ptr %0, i64 293372
  %31 = icmp ult ptr %25, %28
  %32 = icmp ult ptr %27, %26
  %33 = and i1 %31, %32
  %34 = icmp ult ptr %25, %30
  %35 = icmp ult ptr %29, %26
  %36 = and i1 %34, %35
  %37 = or i1 %33, %36
  br label %38

38:                                               ; preds = %24, %92
  %39 = phi i64 [ %93, %92 ], [ 1, %24 ]
  %40 = mul nuw nsw i64 %39, 384
  br i1 %37, label %66, label %41

41:                                               ; preds = %38, %41
  %42 = phi i64 [ %64, %41 ], [ 0, %38 ]
  %43 = or disjoint i64 %42, 1
  %44 = add nuw nsw i64 %43, %40
  %45 = getelementptr i32, ptr %1, i64 %44
  %46 = getelementptr i32, ptr %45, i64 -1
  %47 = load <4 x i32>, ptr %46, align 4, !tbaa !5, !alias.scope !15
  %48 = getelementptr i32, ptr %45, i64 1
  %49 = load <4 x i32>, ptr %48, align 4, !tbaa !5, !alias.scope !15
  %50 = add nsw <4 x i32> %49, %47
  %51 = getelementptr i32, ptr %45, i64 -384
  %52 = load <4 x i32>, ptr %51, align 4, !tbaa !5, !alias.scope !15
  %53 = add nsw <4 x i32> %50, %52
  %54 = getelementptr i32, ptr %45, i64 384
  %55 = load <4 x i32>, ptr %54, align 4, !tbaa !5, !alias.scope !15
  %56 = add nsw <4 x i32> %53, %55
  %57 = sdiv <4 x i32> %56, <i32 2, i32 2, i32 2, i32 2>
  %58 = getelementptr inbounds i32, ptr %0, i64 %44
  %59 = load <4 x i32>, ptr %58, align 4, !tbaa !5, !alias.scope !18
  %60 = sub nsw <4 x i32> %57, %59
  %61 = mul nsw <4 x i32> %60, <i32 998, i32 998, i32 998, i32 998>
  %62 = sdiv <4 x i32> %61, <i32 1000, i32 1000, i32 1000, i32 1000>
  %63 = getelementptr inbounds i32, ptr %2, i64 %44
  store <4 x i32> %62, ptr %63, align 4, !tbaa !5, !alias.scope !20, !noalias !22
  %64 = add nuw i64 %42, 4
  %65 = icmp eq i64 %64, 380
  br i1 %65, label %66, label %41, !llvm.loop !23

66:                                               ; preds = %41, %38
  %67 = phi i64 [ 1, %38 ], [ 381, %41 ]
  br label %68

68:                                               ; preds = %66, %68
  %69 = phi i64 [ %90, %68 ], [ %67, %66 ]
  %70 = add nuw nsw i64 %69, %40
  %71 = getelementptr i32, ptr %1, i64 %70
  %72 = getelementptr i32, ptr %71, i64 -1
  %73 = load i32, ptr %72, align 4, !tbaa !5
  %74 = getelementptr i32, ptr %71, i64 1
  %75 = load i32, ptr %74, align 4, !tbaa !5
  %76 = add nsw i32 %75, %73
  %77 = getelementptr i32, ptr %71, i64 -384
  %78 = load i32, ptr %77, align 4, !tbaa !5
  %79 = add nsw i32 %76, %78
  %80 = getelementptr i32, ptr %71, i64 384
  %81 = load i32, ptr %80, align 4, !tbaa !5
  %82 = add nsw i32 %79, %81
  %83 = sdiv i32 %82, 2
  %84 = getelementptr inbounds i32, ptr %0, i64 %70
  %85 = load i32, ptr %84, align 4, !tbaa !5
  %86 = sub nsw i32 %83, %85
  %87 = mul nsw i32 %86, 998
  %88 = sdiv i32 %87, 1000
  %89 = getelementptr inbounds i32, ptr %2, i64 %70
  store i32 %88, ptr %89, align 4, !tbaa !5
  %90 = add nuw nsw i64 %69, 1
  %91 = icmp eq i64 %90, 383
  br i1 %91, label %92, label %68, !llvm.loop !26

92:                                               ; preds = %68
  %93 = add nuw nsw i64 %39, 1
  %94 = icmp eq i64 %93, 191
  br i1 %94, label %95, label %38, !llvm.loop !27

95:                                               ; preds = %92
  ret void
}

; Function Attrs: noreturn nounwind uwtable
define dso_local void @app() local_unnamed_addr #6 {
  %1 = alloca [73728 x i32], align 16
  %2 = alloca [73728 x i32], align 16
  %3 = alloca [73728 x i32], align 16
  call void @llvm.lifetime.start.p0(i64 294912, ptr nonnull %1) #9
  call void @llvm.lifetime.start.p0(i64 294912, ptr nonnull %2) #9
  call void @llvm.lifetime.start.p0(i64 294912, ptr nonnull %3) #9
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(294912) %1, i8 0, i64 294912, i1 false), !tbaa !5
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(294912) %2, i8 0, i64 294912, i1 false), !tbaa !5
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(294912) %3, i8 0, i64 294912, i1 false), !tbaa !5
  br label %4

4:                                                ; preds = %180, %0
  %5 = phi ptr [ %3, %0 ], [ %8, %180 ]
  %6 = phi i32 [ 0, %0 ], [ %181, %180 ]
  %7 = phi ptr [ %2, %0 ], [ %5, %180 ]
  %8 = phi ptr [ %1, %0 ], [ %7, %180 ]
  %9 = urem i32 %6, 70
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %88

11:                                               ; preds = %4
  %12 = tail call i32 (...) @simRand() #9
  %13 = srem i32 %12, 368
  %14 = add nsw i32 %13, 8
  %15 = tail call i32 (...) @simRand() #9
  %16 = srem i32 %15, 176
  %17 = add nsw i32 %16, 8
  br label %18

18:                                               ; preds = %50, %11
  %19 = phi i32 [ -6, %11 ], [ %51, %50 ]
  %20 = mul nsw i32 %19, %19
  %21 = add nsw i32 %19, %17
  %22 = icmp sgt i32 %21, 0
  %23 = icmp slt i32 %21, 191
  %24 = mul nuw nsw i32 %21, 384
  br label %25

25:                                               ; preds = %47, %18
  %26 = phi i32 [ -6, %18 ], [ %48, %47 ]
  %27 = mul nsw i32 %26, %26
  %28 = add nuw nsw i32 %27, %20
  %29 = icmp ult i32 %28, 37
  br i1 %29, label %30, label %47

30:                                               ; preds = %25
  %31 = add nsw i32 %26, %14
  %32 = add nsw i32 %31, -1
  %33 = icmp ult i32 %32, 382
  %34 = select i1 %33, i1 %22, i1 false
  %35 = select i1 %34, i1 %23, i1 false
  br i1 %35, label %36, label %47

36:                                               ; preds = %30
  %37 = trunc i32 %28 to i16
  %38 = sub nuw nsw i16 36, %37
  %39 = mul nuw i16 %38, 1800
  %40 = udiv i16 %39, 37
  %41 = zext nneg i16 %40 to i32
  %42 = add nuw nsw i32 %31, %24
  %43 = zext nneg i32 %42 to i64
  %44 = getelementptr inbounds i32, ptr %8, i64 %43
  %45 = load i32, ptr %44, align 4, !tbaa !5
  %46 = add nsw i32 %45, %41
  store i32 %46, ptr %44, align 4, !tbaa !5
  br label %47

47:                                               ; preds = %36, %30, %25
  %48 = add nsw i32 %26, 1
  %49 = icmp eq i32 %48, 7
  br i1 %49, label %50, label %25, !llvm.loop !12

50:                                               ; preds = %47
  %51 = add nsw i32 %19, 1
  %52 = icmp eq i32 %51, 7
  br i1 %52, label %53, label %18, !llvm.loop !13

53:                                               ; preds = %50, %85
  %54 = phi i32 [ %86, %85 ], [ -6, %50 ]
  %55 = mul nsw i32 %54, %54
  %56 = add nsw i32 %54, %17
  %57 = icmp sgt i32 %56, 0
  %58 = icmp slt i32 %56, 191
  %59 = mul nuw nsw i32 %56, 384
  br label %60

60:                                               ; preds = %82, %53
  %61 = phi i32 [ -6, %53 ], [ %83, %82 ]
  %62 = mul nsw i32 %61, %61
  %63 = add nuw nsw i32 %62, %55
  %64 = icmp ult i32 %63, 37
  br i1 %64, label %65, label %82

65:                                               ; preds = %60
  %66 = add nsw i32 %61, %14
  %67 = add nsw i32 %66, -1
  %68 = icmp ult i32 %67, 382
  %69 = select i1 %68, i1 %57, i1 false
  %70 = select i1 %69, i1 %58, i1 false
  br i1 %70, label %71, label %82

71:                                               ; preds = %65
  %72 = trunc i32 %63 to i16
  %73 = sub nuw nsw i16 36, %72
  %74 = mul nuw i16 %73, 1800
  %75 = udiv i16 %74, 37
  %76 = zext nneg i16 %75 to i32
  %77 = add nuw nsw i32 %66, %59
  %78 = zext nneg i32 %77 to i64
  %79 = getelementptr inbounds i32, ptr %7, i64 %78
  %80 = load i32, ptr %79, align 4, !tbaa !5
  %81 = add nsw i32 %80, %76
  store i32 %81, ptr %79, align 4, !tbaa !5
  br label %82

82:                                               ; preds = %71, %65, %60
  %83 = add nsw i32 %61, 1
  %84 = icmp eq i32 %83, 7
  br i1 %84, label %85, label %60, !llvm.loop !12

85:                                               ; preds = %82
  %86 = add nsw i32 %54, 1
  %87 = icmp eq i32 %86, 7
  br i1 %87, label %88, label %53, !llvm.loop !13

88:                                               ; preds = %85, %4
  call void @drawField(ptr noundef %7)
  tail call void (...) @simFlush() #9
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(1536) %5, i8 0, i64 1536, i1 false), !tbaa !5
  %89 = getelementptr i8, ptr %5, i64 293376
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(1536) %89, i8 0, i64 1536, i1 false), !tbaa !5
  br label %90

90:                                               ; preds = %90, %88
  %91 = phi i64 [ 0, %88 ], [ %107, %90 ]
  %92 = mul nuw nsw i64 %91, 384
  %93 = getelementptr inbounds i32, ptr %5, i64 %92
  store i32 0, ptr %93, align 4, !tbaa !5
  %94 = getelementptr i32, ptr %93, i64 383
  store i32 0, ptr %94, align 4, !tbaa !5
  %95 = mul nuw i64 %91, 384
  %96 = or disjoint i64 %95, 384
  %97 = getelementptr inbounds i32, ptr %5, i64 %96
  store i32 0, ptr %97, align 4, !tbaa !5
  %98 = getelementptr i32, ptr %97, i64 383
  store i32 0, ptr %98, align 4, !tbaa !5
  %99 = mul nuw i64 %91, 384
  %100 = add nuw i64 %99, 768
  %101 = getelementptr inbounds i32, ptr %5, i64 %100
  store i32 0, ptr %101, align 4, !tbaa !5
  %102 = getelementptr i32, ptr %101, i64 383
  store i32 0, ptr %102, align 4, !tbaa !5
  %103 = mul nuw i64 %91, 384
  %104 = add nuw i64 %103, 1152
  %105 = getelementptr inbounds i32, ptr %5, i64 %104
  store i32 0, ptr %105, align 4, !tbaa !5
  %106 = getelementptr i32, ptr %105, i64 383
  store i32 0, ptr %106, align 4, !tbaa !5
  %107 = add nuw nsw i64 %91, 4
  %108 = icmp eq i64 %107, 192
  br i1 %108, label %109, label %90, !llvm.loop !14

109:                                              ; preds = %90, %137
  %110 = phi i64 [ %178, %137 ], [ 1, %90 ]
  %111 = mul nuw nsw i64 %110, 384
  br label %112

112:                                              ; preds = %112, %109
  %113 = phi i64 [ 0, %109 ], [ %135, %112 ]
  %114 = or disjoint i64 %113, 1
  %115 = add nuw nsw i64 %114, %111
  %116 = getelementptr i32, ptr %7, i64 %115
  %117 = getelementptr i32, ptr %116, i64 -1
  %118 = load <4 x i32>, ptr %117, align 4, !tbaa !5
  %119 = getelementptr i32, ptr %116, i64 1
  %120 = load <4 x i32>, ptr %119, align 4, !tbaa !5
  %121 = add nsw <4 x i32> %120, %118
  %122 = getelementptr i32, ptr %116, i64 -384
  %123 = load <4 x i32>, ptr %122, align 4, !tbaa !5
  %124 = add nsw <4 x i32> %121, %123
  %125 = getelementptr i32, ptr %116, i64 384
  %126 = load <4 x i32>, ptr %125, align 4, !tbaa !5
  %127 = add nsw <4 x i32> %124, %126
  %128 = sdiv <4 x i32> %127, <i32 2, i32 2, i32 2, i32 2>
  %129 = getelementptr inbounds i32, ptr %8, i64 %115
  %130 = load <4 x i32>, ptr %129, align 4, !tbaa !5
  %131 = sub nsw <4 x i32> %128, %130
  %132 = mul nsw <4 x i32> %131, <i32 998, i32 998, i32 998, i32 998>
  %133 = sdiv <4 x i32> %132, <i32 1000, i32 1000, i32 1000, i32 1000>
  %134 = getelementptr inbounds i32, ptr %5, i64 %115
  store <4 x i32> %133, ptr %134, align 4, !tbaa !5
  %135 = add nuw i64 %113, 4
  %136 = icmp eq i64 %135, 380
  br i1 %136, label %137, label %112, !llvm.loop !28

137:                                              ; preds = %112
  %138 = add nuw nsw i64 %111, 381
  %139 = getelementptr i32, ptr %7, i64 %138
  %140 = getelementptr i32, ptr %139, i64 -1
  %141 = load i32, ptr %140, align 4, !tbaa !5
  %142 = getelementptr i32, ptr %139, i64 1
  %143 = load i32, ptr %142, align 4, !tbaa !5
  %144 = add nsw i32 %143, %141
  %145 = getelementptr i32, ptr %139, i64 -384
  %146 = load i32, ptr %145, align 4, !tbaa !5
  %147 = add nsw i32 %144, %146
  %148 = getelementptr i32, ptr %139, i64 384
  %149 = load i32, ptr %148, align 4, !tbaa !5
  %150 = add nsw i32 %147, %149
  %151 = sdiv i32 %150, 2
  %152 = getelementptr inbounds i32, ptr %8, i64 %138
  %153 = load i32, ptr %152, align 4, !tbaa !5
  %154 = sub nsw i32 %151, %153
  %155 = mul nsw i32 %154, 998
  %156 = sdiv i32 %155, 1000
  %157 = getelementptr inbounds i32, ptr %5, i64 %138
  store i32 %156, ptr %157, align 4, !tbaa !5
  %158 = add nuw nsw i64 %111, 382
  %159 = getelementptr i32, ptr %7, i64 %158
  %160 = getelementptr i32, ptr %159, i64 -1
  %161 = load i32, ptr %160, align 4, !tbaa !5
  %162 = getelementptr i32, ptr %159, i64 1
  %163 = load i32, ptr %162, align 4, !tbaa !5
  %164 = add nsw i32 %163, %161
  %165 = getelementptr i32, ptr %159, i64 -384
  %166 = load i32, ptr %165, align 4, !tbaa !5
  %167 = add nsw i32 %164, %166
  %168 = getelementptr i32, ptr %159, i64 384
  %169 = load i32, ptr %168, align 4, !tbaa !5
  %170 = add nsw i32 %167, %169
  %171 = sdiv i32 %170, 2
  %172 = getelementptr inbounds i32, ptr %8, i64 %158
  %173 = load i32, ptr %172, align 4, !tbaa !5
  %174 = sub nsw i32 %171, %173
  %175 = mul nsw i32 %174, 998
  %176 = sdiv i32 %175, 1000
  %177 = getelementptr inbounds i32, ptr %5, i64 %158
  store i32 %176, ptr %177, align 4, !tbaa !5
  %178 = add nuw nsw i64 %110, 1
  %179 = icmp eq i64 %178, 191
  br i1 %179, label %180, label %109, !llvm.loop !27

180:                                              ; preds = %137
  %181 = add nuw nsw i32 %6, 1
  br label %4
}

declare void @simFlush(...) local_unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #7

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #8

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = !{!21}
!21 = distinct !{!21, !17}
!22 = !{!16, !19}
!23 = distinct !{!23, !10, !24, !25}
!24 = !{!"llvm.loop.isvectorized", i32 1}
!25 = !{!"llvm.loop.unroll.runtime.disable"}
!26 = distinct !{!26, !10, !24}
!27 = distinct !{!27, !10}
!28 = distinct !{!28, !10, !24, !25}
