; ModuleID = 'LLVM_Pass/results/app-opt.ll'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@trace.opcode = private unnamed_addr constant [4 x i8] c"ret\00", align 1
@trace.opcode.1 = private unnamed_addr constant [3 x i8] c"br\00", align 1
@trace.opcode.2 = private unnamed_addr constant [4 x i8] c"add\00", align 1
@trace.opcode.3 = private unnamed_addr constant [4 x i8] c"sub\00", align 1
@trace.opcode.4 = private unnamed_addr constant [4 x i8] c"mul\00", align 1
@trace.opcode.5 = private unnamed_addr constant [5 x i8] c"udiv\00", align 1
@trace.opcode.6 = private unnamed_addr constant [5 x i8] c"sdiv\00", align 1
@trace.opcode.7 = private unnamed_addr constant [5 x i8] c"urem\00", align 1
@trace.opcode.8 = private unnamed_addr constant [5 x i8] c"srem\00", align 1
@trace.opcode.9 = private unnamed_addr constant [4 x i8] c"shl\00", align 1
@trace.opcode.10 = private unnamed_addr constant [4 x i8] c"and\00", align 1
@trace.opcode.11 = private unnamed_addr constant [3 x i8] c"or\00", align 1
@trace.opcode.12 = private unnamed_addr constant [7 x i8] c"alloca\00", align 1
@trace.opcode.13 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@trace.opcode.14 = private unnamed_addr constant [6 x i8] c"store\00", align 1
@trace.opcode.15 = private unnamed_addr constant [14 x i8] c"getelementptr\00", align 1
@trace.opcode.16 = private unnamed_addr constant [6 x i8] c"trunc\00", align 1
@trace.opcode.17 = private unnamed_addr constant [5 x i8] c"zext\00", align 1
@trace.opcode.18 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@trace.opcode.19 = private unnamed_addr constant [4 x i8] c"phi\00", align 1
@trace.opcode.20 = private unnamed_addr constant [5 x i8] c"call\00", align 1
@trace.opcode.21 = private unnamed_addr constant [7 x i8] c"select\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @waveToColor(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @llvm.smin.i32(i32 %0, i32 1000)
  call void @__trace_edge(i32 56, i32 56)
  %3 = tail call i32 @llvm.smax.i32(i32 %2, i32 -1000)
  %4 = icmp sgt i32 %0, -1
  call void @__trace_edge(i32 2, i32 53)
  br i1 %4, label %5, label %17

5:                                                ; preds = %1
  call void @__trace_edge(i32 17, i32 56)
  %6 = mul nuw nsw i32 %3, 245
  call void @__trace_edge(i32 19, i32 17)
  %7 = udiv i32 %6, 1000
  call void @__trace_edge(i32 17, i32 56)
  %8 = mul nuw nsw i32 %3, 235
  call void @__trace_edge(i32 19, i32 17)
  %9 = udiv i32 %8, 1000
  call void @__trace_edge(i32 13, i32 19)
  %10 = add nuw nsw i32 %9, 20
  call void @__trace_edge(i32 17, i32 56)
  %11 = mul nuw nsw i32 %3, 215
  call void @__trace_edge(i32 19, i32 17)
  %12 = udiv i32 %11, 1000
  call void @__trace_edge(i32 13, i32 19)
  %13 = add nuw nsw i32 %12, 40
  call void @__trace_edge(i32 25, i32 19)
  %14 = shl nuw nsw i32 %7, 16
  call void @__trace_edge(i32 13, i32 25)
  %15 = add nuw nsw i32 %14, 655360
  call void @__trace_edge(i32 29, i32 13)
  %16 = or i32 %15, -16777216
  br label %25

17:                                               ; preds = %1
  call void @__trace_edge(i32 17, i32 56)
  %18 = mul nsw i32 %3, -30
  call void @__trace_edge(i32 19, i32 17)
  %19 = udiv i32 %18, 1000
  call void @__trace_edge(i32 13, i32 19)
  %20 = add nuw nsw i32 %19, 10
  call void @__trace_edge(i32 38, i32 56)
  %21 = trunc i32 %3 to i16
  call void @__trace_edge(i32 20, i32 38)
  %22 = sdiv i16 %21, -10
  call void @__trace_edge(i32 13, i32 20)
  %23 = add nuw nsw i16 %22, 25
  call void @__trace_edge(i32 39, i32 13)
  %24 = zext nneg i16 %23 to i32
  br label %25

25:                                               ; preds = %17, %5
  %26 = phi i32 [ %16, %5 ], [ -16449536, %17 ]
  %27 = phi i32 [ %10, %5 ], [ %20, %17 ]
  %28 = phi i32 [ %13, %5 ], [ %24, %17 ]
  call void @__trace_edge(i32 25, i32 55)
  %29 = shl nuw nsw i32 %27, 8
  call void @__trace_edge(i32 29, i32 25)
  call void @__trace_edge(i32 29, i32 55)
  %30 = or i32 %29, %26
  call void @__trace_edge(i32 29, i32 29)
  call void @__trace_edge(i32 29, i32 55)
  %31 = or i32 %30, %28
  call void @__trace_edge(i32 1, i32 29)
  ret i32 %31
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local void @drawCell(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #2 {
  %4 = shl nsw i32 %0, 2
  call void @__trace_edge(i32 29, i32 25)
  %5 = or disjoint i32 %4, 1
  %6 = shl nsw i32 %1, 2
  call void @__trace_edge(i32 29, i32 25)
  %7 = or disjoint i32 %6, 1
  call void @__trace_edge(i32 56, i32 29)
  call void @__trace_edge(i32 56, i32 29)
  tail call void @simPutPixel(i32 noundef %5, i32 noundef %7, i32 noundef %2) #9
  call void @__trace_edge(i32 29, i32 25)
  %8 = or disjoint i32 %4, 2
  call void @__trace_edge(i32 56, i32 29)
  call void @__trace_edge(i32 56, i32 29)
  tail call void @simPutPixel(i32 noundef %8, i32 noundef %7, i32 noundef %2) #9
  call void @__trace_edge(i32 29, i32 25)
  %9 = or disjoint i32 %6, 2
  call void @__trace_edge(i32 56, i32 29)
  call void @__trace_edge(i32 56, i32 29)
  tail call void @simPutPixel(i32 noundef %5, i32 noundef %9, i32 noundef %2) #9
  call void @__trace_edge(i32 56, i32 29)
  call void @__trace_edge(i32 56, i32 29)
  tail call void @simPutPixel(i32 noundef %8, i32 noundef %9, i32 noundef %2) #9
  ret void
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local void @drawField(ptr nocapture noundef readonly %0) local_unnamed_addr #2 {
  br label %2

2:                                                ; preds = %52, %1
  %3 = phi i64 [ 0, %1 ], [ %53, %52 ]
  call void @__trace_edge(i32 17, i32 55)
  %4 = mul nuw nsw i64 %3, 384
  call void @__trace_edge(i32 25, i32 55)
  %5 = shl nuw nsw i64 %3, 2
  call void @__trace_edge(i32 34, i32 17)
  %6 = getelementptr i32, ptr %0, i64 %4
  call void @__trace_edge(i32 38, i32 25)
  %7 = trunc i64 %5 to i32
  call void @__trace_edge(i32 29, i32 38)
  %8 = or disjoint i32 %7, 1
  call void @__trace_edge(i32 38, i32 25)
  %9 = trunc i64 %5 to i32
  call void @__trace_edge(i32 29, i32 38)
  %10 = or disjoint i32 %9, 2
  br label %11

11:                                               ; preds = %38, %2
  %12 = phi i64 [ 0, %2 ], [ %50, %38 ]
  call void @__trace_edge(i32 34, i32 34)
  call void @__trace_edge(i32 34, i32 55)
  %13 = getelementptr i32, ptr %6, i64 %12
  call void @__trace_edge(i32 32, i32 34)
  %14 = load i32, ptr %13, align 4, !tbaa !5
  call void @__trace_edge(i32 56, i32 32)
  %15 = tail call i32 @llvm.smin.i32(i32 %14, i32 1000)
  call void @__trace_edge(i32 56, i32 56)
  %16 = tail call i32 @llvm.smax.i32(i32 %15, i32 -1000)
  call void @__trace_edge(i32 53, i32 32)
  %17 = icmp sgt i32 %14, -1
  call void @__trace_edge(i32 2, i32 53)
  br i1 %17, label %18, label %30

18:                                               ; preds = %11
  call void @__trace_edge(i32 17, i32 56)
  %19 = mul nuw nsw i32 %16, 245
  call void @__trace_edge(i32 19, i32 17)
  %20 = udiv i32 %19, 1000
  call void @__trace_edge(i32 17, i32 56)
  %21 = mul nuw nsw i32 %16, 235
  call void @__trace_edge(i32 19, i32 17)
  %22 = udiv i32 %21, 1000
  call void @__trace_edge(i32 13, i32 19)
  %23 = add nuw nsw i32 %22, 20
  call void @__trace_edge(i32 17, i32 56)
  %24 = mul nuw nsw i32 %16, 215
  call void @__trace_edge(i32 19, i32 17)
  %25 = udiv i32 %24, 1000
  call void @__trace_edge(i32 13, i32 19)
  %26 = add nuw nsw i32 %25, 40
  call void @__trace_edge(i32 25, i32 19)
  %27 = shl nuw nsw i32 %20, 16
  call void @__trace_edge(i32 13, i32 25)
  %28 = add nuw nsw i32 %27, 655360
  call void @__trace_edge(i32 29, i32 13)
  %29 = or i32 %28, -16777216
  br label %38

30:                                               ; preds = %11
  call void @__trace_edge(i32 17, i32 56)
  %31 = mul nsw i32 %16, -30
  call void @__trace_edge(i32 19, i32 17)
  %32 = udiv i32 %31, 1000
  call void @__trace_edge(i32 13, i32 19)
  %33 = add nuw nsw i32 %32, 10
  call void @__trace_edge(i32 38, i32 56)
  %34 = trunc i32 %16 to i16
  call void @__trace_edge(i32 20, i32 38)
  %35 = sdiv i16 %34, -10
  call void @__trace_edge(i32 13, i32 20)
  %36 = add nuw nsw i16 %35, 25
  call void @__trace_edge(i32 39, i32 13)
  %37 = zext nneg i16 %36 to i32
  br label %38

38:                                               ; preds = %30, %18
  %39 = phi i32 [ %29, %18 ], [ -16449536, %30 ]
  %40 = phi i32 [ %23, %18 ], [ %33, %30 ]
  %41 = phi i32 [ %26, %18 ], [ %37, %30 ]
  call void @__trace_edge(i32 25, i32 55)
  %42 = shl nuw nsw i32 %40, 8
  call void @__trace_edge(i32 29, i32 25)
  call void @__trace_edge(i32 29, i32 55)
  %43 = or i32 %42, %39
  call void @__trace_edge(i32 29, i32 29)
  call void @__trace_edge(i32 29, i32 55)
  %44 = or i32 %43, %41
  call void @__trace_edge(i32 25, i32 55)
  %45 = shl nuw nsw i64 %12, 2
  call void @__trace_edge(i32 38, i32 25)
  %46 = trunc i64 %45 to i32
  call void @__trace_edge(i32 29, i32 38)
  %47 = or disjoint i32 %46, 1
  call void @__trace_edge(i32 56, i32 29)
  call void @__trace_edge(i32 56, i32 29)
  call void @__trace_edge(i32 56, i32 29)
  tail call void @simPutPixel(i32 noundef %47, i32 noundef %8, i32 noundef %44) #9
  call void @__trace_edge(i32 38, i32 25)
  %48 = trunc i64 %45 to i32
  call void @__trace_edge(i32 29, i32 38)
  %49 = or disjoint i32 %48, 2
  call void @__trace_edge(i32 56, i32 29)
  call void @__trace_edge(i32 56, i32 29)
  call void @__trace_edge(i32 56, i32 29)
  tail call void @simPutPixel(i32 noundef %49, i32 noundef %8, i32 noundef %44) #9
  call void @__trace_edge(i32 56, i32 29)
  call void @__trace_edge(i32 56, i32 29)
  call void @__trace_edge(i32 56, i32 29)
  tail call void @simPutPixel(i32 noundef %47, i32 noundef %10, i32 noundef %44) #9
  call void @__trace_edge(i32 56, i32 29)
  call void @__trace_edge(i32 56, i32 29)
  call void @__trace_edge(i32 56, i32 29)
  tail call void @simPutPixel(i32 noundef %49, i32 noundef %10, i32 noundef %44) #9
  call void @__trace_edge(i32 13, i32 55)
  %50 = add nuw nsw i64 %12, 1
  call void @__trace_edge(i32 53, i32 13)
  %51 = icmp eq i64 %50, 384
  call void @__trace_edge(i32 2, i32 53)
  br i1 %51, label %52, label %11, !llvm.loop !9

52:                                               ; preds = %38
  call void @__trace_edge(i32 13, i32 55)
  %53 = add nuw nsw i64 %3, 1
  call void @__trace_edge(i32 53, i32 13)
  %54 = icmp eq i64 %53, 192
  call void @__trace_edge(i32 2, i32 53)
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

4:                                                ; preds = %36, %3
  %5 = phi i32 [ -6, %3 ], [ %37, %36 ]
  call void @__trace_edge(i32 17, i32 55)
  call void @__trace_edge(i32 17, i32 55)
  %6 = mul nsw i32 %5, %5
  call void @__trace_edge(i32 13, i32 55)
  %7 = add nsw i32 %5, %2
  call void @__trace_edge(i32 53, i32 13)
  %8 = icmp sgt i32 %7, 0
  call void @__trace_edge(i32 53, i32 13)
  %9 = icmp slt i32 %7, 191
  call void @__trace_edge(i32 17, i32 13)
  %10 = mul nuw nsw i32 %7, 384
  br label %11

11:                                               ; preds = %33, %4
  %12 = phi i32 [ -6, %4 ], [ %34, %33 ]
  call void @__trace_edge(i32 17, i32 55)
  call void @__trace_edge(i32 17, i32 55)
  %13 = mul nsw i32 %12, %12
  call void @__trace_edge(i32 13, i32 17)
  call void @__trace_edge(i32 13, i32 17)
  %14 = add nuw nsw i32 %13, %6
  call void @__trace_edge(i32 53, i32 13)
  %15 = icmp ult i32 %14, 37
  call void @__trace_edge(i32 2, i32 53)
  br i1 %15, label %16, label %33

16:                                               ; preds = %11
  call void @__trace_edge(i32 13, i32 55)
  %17 = add nsw i32 %12, %1
  call void @__trace_edge(i32 13, i32 13)
  %18 = add i32 %17, -1
  call void @__trace_edge(i32 53, i32 13)
  %19 = icmp ult i32 %18, 382
  call void @__trace_edge(i32 57, i32 53)
  call void @__trace_edge(i32 57, i32 53)
  %20 = select i1 %19, i1 %8, i1 false
  call void @__trace_edge(i32 57, i32 57)
  call void @__trace_edge(i32 57, i32 53)
  %21 = select i1 %20, i1 %9, i1 false
  call void @__trace_edge(i32 2, i32 57)
  br i1 %21, label %22, label %33

22:                                               ; preds = %16
  call void @__trace_edge(i32 38, i32 13)
  %23 = trunc i32 %14 to i16
  call void @__trace_edge(i32 15, i32 38)
  %24 = sub nuw nsw i16 36, %23
  call void @__trace_edge(i32 17, i32 15)
  %25 = mul nuw i16 %24, 1800
  call void @__trace_edge(i32 19, i32 17)
  %26 = udiv i16 %25, 37
  call void @__trace_edge(i32 39, i32 19)
  %27 = zext nneg i16 %26 to i32
  call void @__trace_edge(i32 13, i32 13)
  call void @__trace_edge(i32 13, i32 17)
  %28 = add nuw nsw i32 %17, %10
  call void @__trace_edge(i32 39, i32 13)
  %29 = zext nneg i32 %28 to i64
  call void @__trace_edge(i32 34, i32 39)
  %30 = getelementptr inbounds i32, ptr %0, i64 %29
  call void @__trace_edge(i32 32, i32 34)
  %31 = load i32, ptr %30, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 32)
  call void @__trace_edge(i32 13, i32 39)
  %32 = add nsw i32 %31, %27
  call void @__trace_edge(i32 33, i32 13)
  call void @__trace_edge(i32 33, i32 34)
  store i32 %32, ptr %30, align 4, !tbaa !5
  br label %33

33:                                               ; preds = %22, %16, %11
  call void @__trace_edge(i32 13, i32 55)
  %34 = add nsw i32 %12, 1
  call void @__trace_edge(i32 53, i32 13)
  %35 = icmp eq i32 %34, 7
  call void @__trace_edge(i32 2, i32 53)
  br i1 %35, label %36, label %11, !llvm.loop !12

36:                                               ; preds = %33
  call void @__trace_edge(i32 13, i32 55)
  %37 = add nsw i32 %5, 1
  call void @__trace_edge(i32 53, i32 13)
  %38 = icmp eq i32 %37, 7
  call void @__trace_edge(i32 2, i32 53)
  br i1 %38, label %39, label %4, !llvm.loop !13

39:                                               ; preds = %36
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @randomX() local_unnamed_addr #2 {
  %1 = tail call i32 (...) @simRand() #9
  call void @__trace_edge(i32 23, i32 56)
  %2 = srem i32 %1, 368
  call void @__trace_edge(i32 13, i32 23)
  %3 = add nsw i32 %2, 8
  call void @__trace_edge(i32 1, i32 13)
  ret i32 %3
}

declare i32 @simRand(...) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local i32 @randomY() local_unnamed_addr #2 {
  %1 = tail call i32 (...) @simRand() #9
  call void @__trace_edge(i32 23, i32 56)
  %2 = srem i32 %1, 176
  call void @__trace_edge(i32 13, i32 23)
  %3 = add nsw i32 %2, 8
  call void @__trace_edge(i32 1, i32 13)
  ret i32 %3
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @stepWave(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1, ptr nocapture noundef writeonly %2) local_unnamed_addr #5 {
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(1536) %2, i8 0, i64 1536, i1 false), !tbaa !5
  %4 = getelementptr i8, ptr %2, i64 293376
  call void @__trace_edge(i32 56, i32 34)
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(1536) %4, i8 0, i64 1536, i1 false), !tbaa !5
  br label %5

5:                                                ; preds = %5, %3
  %6 = phi i64 [ 0, %3 ], [ %22, %5 ]
  call void @__trace_edge(i32 17, i32 55)
  %7 = mul nuw nsw i64 %6, 384
  call void @__trace_edge(i32 34, i32 17)
  %8 = getelementptr inbounds i32, ptr %2, i64 %7
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %8, align 4, !tbaa !5
  call void @__trace_edge(i32 34, i32 34)
  %9 = getelementptr i32, ptr %8, i64 383
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %9, align 4, !tbaa !5
  call void @__trace_edge(i32 17, i32 55)
  %10 = mul nuw i64 %6, 384
  call void @__trace_edge(i32 29, i32 17)
  %11 = or disjoint i64 %10, 384
  call void @__trace_edge(i32 34, i32 29)
  %12 = getelementptr inbounds i32, ptr %2, i64 %11
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %12, align 4, !tbaa !5
  call void @__trace_edge(i32 34, i32 34)
  %13 = getelementptr i32, ptr %12, i64 383
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %13, align 4, !tbaa !5
  call void @__trace_edge(i32 17, i32 55)
  %14 = mul nuw i64 %6, 384
  call void @__trace_edge(i32 34, i32 17)
  %15 = getelementptr i32, ptr %2, i64 %14
  call void @__trace_edge(i32 34, i32 34)
  %16 = getelementptr i32, ptr %15, i64 768
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %16, align 4, !tbaa !5
  call void @__trace_edge(i32 34, i32 34)
  %17 = getelementptr i32, ptr %15, i64 1151
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %17, align 4, !tbaa !5
  call void @__trace_edge(i32 17, i32 55)
  %18 = mul nuw i64 %6, 384
  call void @__trace_edge(i32 34, i32 17)
  %19 = getelementptr i32, ptr %2, i64 %18
  call void @__trace_edge(i32 34, i32 34)
  %20 = getelementptr i32, ptr %19, i64 1152
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %20, align 4, !tbaa !5
  call void @__trace_edge(i32 34, i32 34)
  %21 = getelementptr i32, ptr %19, i64 1535
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %21, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 55)
  %22 = add nuw nsw i64 %6, 4
  call void @__trace_edge(i32 53, i32 13)
  %23 = icmp eq i64 %22, 192
  call void @__trace_edge(i32 2, i32 53)
  br i1 %23, label %24, label %5, !llvm.loop !14

24:                                               ; preds = %5
  %25 = getelementptr i8, ptr %2, i64 1540
  %26 = getelementptr i8, ptr %2, i64 293372
  %27 = getelementptr i8, ptr %1, i64 4
  %28 = getelementptr i8, ptr %1, i64 294908
  %29 = getelementptr i8, ptr %0, i64 1540
  %30 = getelementptr i8, ptr %0, i64 293372
  call void @__trace_edge(i32 53, i32 34)
  call void @__trace_edge(i32 53, i32 34)
  %31 = icmp ult ptr %25, %28
  call void @__trace_edge(i32 53, i32 34)
  call void @__trace_edge(i32 53, i32 34)
  %32 = icmp ult ptr %27, %26
  call void @__trace_edge(i32 28, i32 53)
  call void @__trace_edge(i32 28, i32 53)
  %33 = and i1 %31, %32
  call void @__trace_edge(i32 53, i32 34)
  call void @__trace_edge(i32 53, i32 34)
  %34 = icmp ult ptr %25, %30
  call void @__trace_edge(i32 53, i32 34)
  call void @__trace_edge(i32 53, i32 34)
  %35 = icmp ult ptr %29, %26
  call void @__trace_edge(i32 28, i32 53)
  call void @__trace_edge(i32 28, i32 53)
  %36 = and i1 %34, %35
  call void @__trace_edge(i32 29, i32 28)
  call void @__trace_edge(i32 29, i32 28)
  %37 = or i1 %33, %36
  br label %38

38:                                               ; preds = %92, %24
  %39 = phi i64 [ %93, %92 ], [ 1, %24 ]
  call void @__trace_edge(i32 17, i32 55)
  %40 = mul nuw nsw i64 %39, 384
  call void @__trace_edge(i32 2, i32 29)
  br i1 %37, label %66, label %41

41:                                               ; preds = %41, %38
  %42 = phi i64 [ %64, %41 ], [ 0, %38 ]
  call void @__trace_edge(i32 29, i32 55)
  %43 = or disjoint i64 %42, 1
  call void @__trace_edge(i32 13, i32 29)
  call void @__trace_edge(i32 13, i32 17)
  %44 = add nuw nsw i64 %43, %40
  call void @__trace_edge(i32 34, i32 13)
  %45 = getelementptr i32, ptr %1, i64 %44
  call void @__trace_edge(i32 34, i32 34)
  %46 = getelementptr i32, ptr %45, i64 -1
  call void @__trace_edge(i32 32, i32 34)
  %47 = load <4 x i32>, ptr %46, align 4, !tbaa !5, !alias.scope !15
  call void @__trace_edge(i32 34, i32 34)
  %48 = getelementptr i32, ptr %45, i64 1
  call void @__trace_edge(i32 32, i32 34)
  %49 = load <4 x i32>, ptr %48, align 4, !tbaa !5, !alias.scope !15
  call void @__trace_edge(i32 13, i32 32)
  call void @__trace_edge(i32 13, i32 32)
  %50 = add nsw <4 x i32> %49, %47
  call void @__trace_edge(i32 34, i32 34)
  %51 = getelementptr i32, ptr %45, i64 -384
  call void @__trace_edge(i32 32, i32 34)
  %52 = load <4 x i32>, ptr %51, align 4, !tbaa !5, !alias.scope !15
  call void @__trace_edge(i32 13, i32 13)
  call void @__trace_edge(i32 13, i32 32)
  %53 = add nsw <4 x i32> %50, %52
  call void @__trace_edge(i32 34, i32 34)
  %54 = getelementptr i32, ptr %45, i64 384
  call void @__trace_edge(i32 32, i32 34)
  %55 = load <4 x i32>, ptr %54, align 4, !tbaa !5, !alias.scope !15
  call void @__trace_edge(i32 13, i32 13)
  call void @__trace_edge(i32 13, i32 32)
  %56 = add nsw <4 x i32> %53, %55
  call void @__trace_edge(i32 20, i32 13)
  %57 = sdiv <4 x i32> %56, <i32 2, i32 2, i32 2, i32 2>
  call void @__trace_edge(i32 34, i32 13)
  %58 = getelementptr inbounds i32, ptr %0, i64 %44
  call void @__trace_edge(i32 32, i32 34)
  %59 = load <4 x i32>, ptr %58, align 4, !tbaa !5, !alias.scope !18
  call void @__trace_edge(i32 15, i32 20)
  call void @__trace_edge(i32 15, i32 32)
  %60 = sub nsw <4 x i32> %57, %59
  call void @__trace_edge(i32 17, i32 15)
  %61 = mul nsw <4 x i32> %60, <i32 998, i32 998, i32 998, i32 998>
  call void @__trace_edge(i32 20, i32 17)
  %62 = sdiv <4 x i32> %61, <i32 1000, i32 1000, i32 1000, i32 1000>
  call void @__trace_edge(i32 34, i32 13)
  %63 = getelementptr inbounds i32, ptr %2, i64 %44
  call void @__trace_edge(i32 33, i32 20)
  call void @__trace_edge(i32 33, i32 34)
  store <4 x i32> %62, ptr %63, align 4, !tbaa !5, !alias.scope !20, !noalias !22
  call void @__trace_edge(i32 13, i32 55)
  %64 = add nuw i64 %42, 4
  call void @__trace_edge(i32 53, i32 13)
  %65 = icmp eq i64 %64, 380
  call void @__trace_edge(i32 2, i32 53)
  br i1 %65, label %66, label %41, !llvm.loop !23

66:                                               ; preds = %41, %38
  %67 = phi i64 [ 1, %38 ], [ 381, %41 ]
  br label %68

68:                                               ; preds = %68, %66
  %69 = phi i64 [ %90, %68 ], [ %67, %66 ]
  call void @__trace_edge(i32 13, i32 55)
  call void @__trace_edge(i32 13, i32 17)
  %70 = add nuw nsw i64 %69, %40
  call void @__trace_edge(i32 34, i32 13)
  %71 = getelementptr i32, ptr %1, i64 %70
  call void @__trace_edge(i32 34, i32 34)
  %72 = getelementptr i32, ptr %71, i64 -1
  call void @__trace_edge(i32 32, i32 34)
  %73 = load i32, ptr %72, align 4, !tbaa !5
  call void @__trace_edge(i32 34, i32 34)
  %74 = getelementptr i32, ptr %71, i64 1
  call void @__trace_edge(i32 32, i32 34)
  %75 = load i32, ptr %74, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 32)
  call void @__trace_edge(i32 13, i32 32)
  %76 = add nsw i32 %75, %73
  call void @__trace_edge(i32 34, i32 34)
  %77 = getelementptr i32, ptr %71, i64 -384
  call void @__trace_edge(i32 32, i32 34)
  %78 = load i32, ptr %77, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 13)
  call void @__trace_edge(i32 13, i32 32)
  %79 = add nsw i32 %76, %78
  call void @__trace_edge(i32 34, i32 34)
  %80 = getelementptr i32, ptr %71, i64 384
  call void @__trace_edge(i32 32, i32 34)
  %81 = load i32, ptr %80, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 13)
  call void @__trace_edge(i32 13, i32 32)
  %82 = add nsw i32 %79, %81
  call void @__trace_edge(i32 20, i32 13)
  %83 = sdiv i32 %82, 2
  call void @__trace_edge(i32 34, i32 13)
  %84 = getelementptr inbounds i32, ptr %0, i64 %70
  call void @__trace_edge(i32 32, i32 34)
  %85 = load i32, ptr %84, align 4, !tbaa !5
  call void @__trace_edge(i32 15, i32 20)
  call void @__trace_edge(i32 15, i32 32)
  %86 = sub nsw i32 %83, %85
  call void @__trace_edge(i32 17, i32 15)
  %87 = mul nsw i32 %86, 998
  call void @__trace_edge(i32 20, i32 17)
  %88 = sdiv i32 %87, 1000
  call void @__trace_edge(i32 34, i32 13)
  %89 = getelementptr inbounds i32, ptr %2, i64 %70
  call void @__trace_edge(i32 33, i32 20)
  call void @__trace_edge(i32 33, i32 34)
  store i32 %88, ptr %89, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 55)
  %90 = add nuw nsw i64 %69, 1
  call void @__trace_edge(i32 53, i32 13)
  %91 = icmp eq i64 %90, 383
  call void @__trace_edge(i32 2, i32 53)
  br i1 %91, label %92, label %68, !llvm.loop !26

92:                                               ; preds = %68
  call void @__trace_edge(i32 13, i32 55)
  %93 = add nuw nsw i64 %39, 1
  call void @__trace_edge(i32 53, i32 13)
  %94 = icmp eq i64 %93, 191
  call void @__trace_edge(i32 2, i32 53)
  br i1 %94, label %95, label %38, !llvm.loop !27

95:                                               ; preds = %92
  ret void
}

; Function Attrs: noreturn nounwind uwtable
define dso_local void @app() local_unnamed_addr #6 {
  call void @__trace_register_opcode(i32 1, ptr @trace.opcode)
  call void @__trace_register_opcode(i32 2, ptr @trace.opcode.1)
  call void @__trace_register_opcode(i32 13, ptr @trace.opcode.2)
  call void @__trace_register_opcode(i32 15, ptr @trace.opcode.3)
  call void @__trace_register_opcode(i32 17, ptr @trace.opcode.4)
  call void @__trace_register_opcode(i32 19, ptr @trace.opcode.5)
  call void @__trace_register_opcode(i32 20, ptr @trace.opcode.6)
  call void @__trace_register_opcode(i32 22, ptr @trace.opcode.7)
  call void @__trace_register_opcode(i32 23, ptr @trace.opcode.8)
  call void @__trace_register_opcode(i32 25, ptr @trace.opcode.9)
  call void @__trace_register_opcode(i32 28, ptr @trace.opcode.10)
  call void @__trace_register_opcode(i32 29, ptr @trace.opcode.11)
  call void @__trace_register_opcode(i32 31, ptr @trace.opcode.12)
  call void @__trace_register_opcode(i32 32, ptr @trace.opcode.13)
  call void @__trace_register_opcode(i32 33, ptr @trace.opcode.14)
  call void @__trace_register_opcode(i32 34, ptr @trace.opcode.15)
  call void @__trace_register_opcode(i32 38, ptr @trace.opcode.16)
  call void @__trace_register_opcode(i32 39, ptr @trace.opcode.17)
  call void @__trace_register_opcode(i32 53, ptr @trace.opcode.18)
  call void @__trace_register_opcode(i32 55, ptr @trace.opcode.19)
  call void @__trace_register_opcode(i32 56, ptr @trace.opcode.20)
  call void @__trace_register_opcode(i32 57, ptr @trace.opcode.21)
  %1 = alloca [73728 x i32], align 16
  %2 = alloca [73728 x i32], align 16
  %3 = alloca [73728 x i32], align 16
  call void @__trace_edge(i32 56, i32 31)
  call void @llvm.lifetime.start.p0(i64 294912, ptr nonnull %1) #9
  call void @__trace_edge(i32 56, i32 31)
  call void @llvm.lifetime.start.p0(i64 294912, ptr nonnull %2) #9
  call void @__trace_edge(i32 56, i32 31)
  call void @llvm.lifetime.start.p0(i64 294912, ptr nonnull %3) #9
  call void @__trace_edge(i32 56, i32 31)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(294912) %1, i8 0, i64 294912, i1 false), !tbaa !5
  call void @__trace_edge(i32 56, i32 31)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(294912) %2, i8 0, i64 294912, i1 false), !tbaa !5
  call void @__trace_edge(i32 56, i32 31)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(294912) %3, i8 0, i64 294912, i1 false), !tbaa !5
  br label %4

4:                                                ; preds = %180, %0
  %5 = phi ptr [ %3, %0 ], [ %8, %180 ]
  %6 = phi i32 [ 0, %0 ], [ %181, %180 ]
  %7 = phi ptr [ %2, %0 ], [ %5, %180 ]
  %8 = phi ptr [ %1, %0 ], [ %7, %180 ]
  call void @__trace_edge(i32 22, i32 55)
  %9 = urem i32 %6, 70
  call void @__trace_edge(i32 53, i32 22)
  %10 = icmp eq i32 %9, 0
  call void @__trace_edge(i32 2, i32 53)
  br i1 %10, label %11, label %88

11:                                               ; preds = %4
  %12 = tail call i32 (...) @simRand() #9
  call void @__trace_edge(i32 23, i32 56)
  %13 = srem i32 %12, 368
  call void @__trace_edge(i32 13, i32 23)
  %14 = add nsw i32 %13, 8
  %15 = tail call i32 (...) @simRand() #9
  call void @__trace_edge(i32 23, i32 56)
  %16 = srem i32 %15, 176
  call void @__trace_edge(i32 13, i32 23)
  %17 = add nsw i32 %16, 8
  br label %18

18:                                               ; preds = %50, %11
  %19 = phi i32 [ -6, %11 ], [ %51, %50 ]
  call void @__trace_edge(i32 17, i32 55)
  call void @__trace_edge(i32 17, i32 55)
  %20 = mul nsw i32 %19, %19
  call void @__trace_edge(i32 13, i32 55)
  call void @__trace_edge(i32 13, i32 13)
  %21 = add nsw i32 %19, %17
  call void @__trace_edge(i32 53, i32 13)
  %22 = icmp sgt i32 %21, 0
  call void @__trace_edge(i32 53, i32 13)
  %23 = icmp slt i32 %21, 191
  call void @__trace_edge(i32 17, i32 13)
  %24 = mul nuw nsw i32 %21, 384
  br label %25

25:                                               ; preds = %47, %18
  %26 = phi i32 [ -6, %18 ], [ %48, %47 ]
  call void @__trace_edge(i32 17, i32 55)
  call void @__trace_edge(i32 17, i32 55)
  %27 = mul nsw i32 %26, %26
  call void @__trace_edge(i32 13, i32 17)
  call void @__trace_edge(i32 13, i32 17)
  %28 = add nuw nsw i32 %27, %20
  call void @__trace_edge(i32 53, i32 13)
  %29 = icmp ult i32 %28, 37
  call void @__trace_edge(i32 2, i32 53)
  br i1 %29, label %30, label %47

30:                                               ; preds = %25
  call void @__trace_edge(i32 13, i32 55)
  call void @__trace_edge(i32 13, i32 13)
  %31 = add nsw i32 %26, %14
  call void @__trace_edge(i32 13, i32 13)
  %32 = add nsw i32 %31, -1
  call void @__trace_edge(i32 53, i32 13)
  %33 = icmp ult i32 %32, 382
  call void @__trace_edge(i32 57, i32 53)
  call void @__trace_edge(i32 57, i32 53)
  %34 = select i1 %33, i1 %22, i1 false
  call void @__trace_edge(i32 57, i32 57)
  call void @__trace_edge(i32 57, i32 53)
  %35 = select i1 %34, i1 %23, i1 false
  call void @__trace_edge(i32 2, i32 57)
  br i1 %35, label %36, label %47

36:                                               ; preds = %30
  call void @__trace_edge(i32 38, i32 13)
  %37 = trunc i32 %28 to i16
  call void @__trace_edge(i32 15, i32 38)
  %38 = sub nuw nsw i16 36, %37
  call void @__trace_edge(i32 17, i32 15)
  %39 = mul nuw i16 %38, 1800
  call void @__trace_edge(i32 19, i32 17)
  %40 = udiv i16 %39, 37
  call void @__trace_edge(i32 39, i32 19)
  %41 = zext nneg i16 %40 to i32
  call void @__trace_edge(i32 13, i32 13)
  call void @__trace_edge(i32 13, i32 17)
  %42 = add nuw nsw i32 %31, %24
  call void @__trace_edge(i32 39, i32 13)
  %43 = zext nneg i32 %42 to i64
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 39)
  %44 = getelementptr inbounds i32, ptr %8, i64 %43
  call void @__trace_edge(i32 32, i32 34)
  %45 = load i32, ptr %44, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 32)
  call void @__trace_edge(i32 13, i32 39)
  %46 = add nsw i32 %45, %41
  call void @__trace_edge(i32 33, i32 13)
  call void @__trace_edge(i32 33, i32 34)
  store i32 %46, ptr %44, align 4, !tbaa !5
  br label %47

47:                                               ; preds = %36, %30, %25
  call void @__trace_edge(i32 13, i32 55)
  %48 = add nsw i32 %26, 1
  call void @__trace_edge(i32 53, i32 13)
  %49 = icmp eq i32 %48, 7
  call void @__trace_edge(i32 2, i32 53)
  br i1 %49, label %50, label %25, !llvm.loop !12

50:                                               ; preds = %47
  call void @__trace_edge(i32 13, i32 55)
  %51 = add nsw i32 %19, 1
  call void @__trace_edge(i32 53, i32 13)
  %52 = icmp eq i32 %51, 7
  call void @__trace_edge(i32 2, i32 53)
  br i1 %52, label %53, label %18, !llvm.loop !13

53:                                               ; preds = %85, %50
  %54 = phi i32 [ %86, %85 ], [ -6, %50 ]
  call void @__trace_edge(i32 17, i32 55)
  call void @__trace_edge(i32 17, i32 55)
  %55 = mul nsw i32 %54, %54
  call void @__trace_edge(i32 13, i32 55)
  call void @__trace_edge(i32 13, i32 13)
  %56 = add nsw i32 %54, %17
  call void @__trace_edge(i32 53, i32 13)
  %57 = icmp sgt i32 %56, 0
  call void @__trace_edge(i32 53, i32 13)
  %58 = icmp slt i32 %56, 191
  call void @__trace_edge(i32 17, i32 13)
  %59 = mul nuw nsw i32 %56, 384
  br label %60

60:                                               ; preds = %82, %53
  %61 = phi i32 [ -6, %53 ], [ %83, %82 ]
  call void @__trace_edge(i32 17, i32 55)
  call void @__trace_edge(i32 17, i32 55)
  %62 = mul nsw i32 %61, %61
  call void @__trace_edge(i32 13, i32 17)
  call void @__trace_edge(i32 13, i32 17)
  %63 = add nuw nsw i32 %62, %55
  call void @__trace_edge(i32 53, i32 13)
  %64 = icmp ult i32 %63, 37
  call void @__trace_edge(i32 2, i32 53)
  br i1 %64, label %65, label %82

65:                                               ; preds = %60
  call void @__trace_edge(i32 13, i32 55)
  call void @__trace_edge(i32 13, i32 13)
  %66 = add nsw i32 %61, %14
  call void @__trace_edge(i32 13, i32 13)
  %67 = add nsw i32 %66, -1
  call void @__trace_edge(i32 53, i32 13)
  %68 = icmp ult i32 %67, 382
  call void @__trace_edge(i32 57, i32 53)
  call void @__trace_edge(i32 57, i32 53)
  %69 = select i1 %68, i1 %57, i1 false
  call void @__trace_edge(i32 57, i32 57)
  call void @__trace_edge(i32 57, i32 53)
  %70 = select i1 %69, i1 %58, i1 false
  call void @__trace_edge(i32 2, i32 57)
  br i1 %70, label %71, label %82

71:                                               ; preds = %65
  call void @__trace_edge(i32 38, i32 13)
  %72 = trunc i32 %63 to i16
  call void @__trace_edge(i32 15, i32 38)
  %73 = sub nuw nsw i16 36, %72
  call void @__trace_edge(i32 17, i32 15)
  %74 = mul nuw i16 %73, 1800
  call void @__trace_edge(i32 19, i32 17)
  %75 = udiv i16 %74, 37
  call void @__trace_edge(i32 39, i32 19)
  %76 = zext nneg i16 %75 to i32
  call void @__trace_edge(i32 13, i32 13)
  call void @__trace_edge(i32 13, i32 17)
  %77 = add nuw nsw i32 %66, %59
  call void @__trace_edge(i32 39, i32 13)
  %78 = zext nneg i32 %77 to i64
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 39)
  %79 = getelementptr inbounds i32, ptr %7, i64 %78
  call void @__trace_edge(i32 32, i32 34)
  %80 = load i32, ptr %79, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 32)
  call void @__trace_edge(i32 13, i32 39)
  %81 = add nsw i32 %80, %76
  call void @__trace_edge(i32 33, i32 13)
  call void @__trace_edge(i32 33, i32 34)
  store i32 %81, ptr %79, align 4, !tbaa !5
  br label %82

82:                                               ; preds = %71, %65, %60
  call void @__trace_edge(i32 13, i32 55)
  %83 = add nsw i32 %61, 1
  call void @__trace_edge(i32 53, i32 13)
  %84 = icmp eq i32 %83, 7
  call void @__trace_edge(i32 2, i32 53)
  br i1 %84, label %85, label %60, !llvm.loop !12

85:                                               ; preds = %82
  call void @__trace_edge(i32 13, i32 55)
  %86 = add nsw i32 %54, 1
  call void @__trace_edge(i32 53, i32 13)
  %87 = icmp eq i32 %86, 7
  call void @__trace_edge(i32 2, i32 53)
  br i1 %87, label %88, label %53, !llvm.loop !13

88:                                               ; preds = %85, %4
  call void @__trace_edge(i32 56, i32 55)
  call void @drawField(ptr noundef %7)
  tail call void (...) @simFlush() #9
  call void @__trace_after_flush()
  call void @__trace_edge(i32 56, i32 55)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(1536) %5, i8 0, i64 1536, i1 false), !tbaa !5
  call void @__trace_edge(i32 34, i32 55)
  %89 = getelementptr i8, ptr %5, i64 293376
  call void @__trace_edge(i32 56, i32 34)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(1536) %89, i8 0, i64 1536, i1 false), !tbaa !5
  br label %90

90:                                               ; preds = %90, %88
  %91 = phi i64 [ 0, %88 ], [ %107, %90 ]
  call void @__trace_edge(i32 17, i32 55)
  %92 = mul nuw nsw i64 %91, 384
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 17)
  %93 = getelementptr inbounds i32, ptr %5, i64 %92
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %93, align 4, !tbaa !5
  call void @__trace_edge(i32 34, i32 34)
  %94 = getelementptr i32, ptr %93, i64 383
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %94, align 4, !tbaa !5
  call void @__trace_edge(i32 17, i32 55)
  %95 = mul nuw i64 %91, 384
  call void @__trace_edge(i32 29, i32 17)
  %96 = or disjoint i64 %95, 384
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 29)
  %97 = getelementptr inbounds i32, ptr %5, i64 %96
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %97, align 4, !tbaa !5
  call void @__trace_edge(i32 34, i32 34)
  %98 = getelementptr i32, ptr %97, i64 383
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %98, align 4, !tbaa !5
  call void @__trace_edge(i32 17, i32 55)
  %99 = mul nuw i64 %91, 384
  call void @__trace_edge(i32 13, i32 17)
  %100 = add nuw i64 %99, 768
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 13)
  %101 = getelementptr inbounds i32, ptr %5, i64 %100
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %101, align 4, !tbaa !5
  call void @__trace_edge(i32 34, i32 34)
  %102 = getelementptr i32, ptr %101, i64 383
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %102, align 4, !tbaa !5
  call void @__trace_edge(i32 17, i32 55)
  %103 = mul nuw i64 %91, 384
  call void @__trace_edge(i32 13, i32 17)
  %104 = add nuw i64 %103, 1152
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 13)
  %105 = getelementptr inbounds i32, ptr %5, i64 %104
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %105, align 4, !tbaa !5
  call void @__trace_edge(i32 34, i32 34)
  %106 = getelementptr i32, ptr %105, i64 383
  call void @__trace_edge(i32 33, i32 34)
  store i32 0, ptr %106, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 55)
  %107 = add nuw nsw i64 %91, 4
  call void @__trace_edge(i32 53, i32 13)
  %108 = icmp eq i64 %107, 192
  call void @__trace_edge(i32 2, i32 53)
  br i1 %108, label %109, label %90, !llvm.loop !14

109:                                              ; preds = %137, %90
  %110 = phi i64 [ %178, %137 ], [ 1, %90 ]
  call void @__trace_edge(i32 17, i32 55)
  %111 = mul nuw nsw i64 %110, 384
  br label %112

112:                                              ; preds = %112, %109
  %113 = phi i64 [ 0, %109 ], [ %135, %112 ]
  call void @__trace_edge(i32 29, i32 55)
  %114 = or disjoint i64 %113, 1
  call void @__trace_edge(i32 13, i32 29)
  call void @__trace_edge(i32 13, i32 17)
  %115 = add nuw nsw i64 %114, %111
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 13)
  %116 = getelementptr i32, ptr %7, i64 %115
  call void @__trace_edge(i32 34, i32 34)
  %117 = getelementptr i32, ptr %116, i64 -1
  call void @__trace_edge(i32 32, i32 34)
  %118 = load <4 x i32>, ptr %117, align 4, !tbaa !5
  call void @__trace_edge(i32 34, i32 34)
  %119 = getelementptr i32, ptr %116, i64 1
  call void @__trace_edge(i32 32, i32 34)
  %120 = load <4 x i32>, ptr %119, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 32)
  call void @__trace_edge(i32 13, i32 32)
  %121 = add nsw <4 x i32> %120, %118
  call void @__trace_edge(i32 34, i32 34)
  %122 = getelementptr i32, ptr %116, i64 -384
  call void @__trace_edge(i32 32, i32 34)
  %123 = load <4 x i32>, ptr %122, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 13)
  call void @__trace_edge(i32 13, i32 32)
  %124 = add nsw <4 x i32> %121, %123
  call void @__trace_edge(i32 34, i32 34)
  %125 = getelementptr i32, ptr %116, i64 384
  call void @__trace_edge(i32 32, i32 34)
  %126 = load <4 x i32>, ptr %125, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 13)
  call void @__trace_edge(i32 13, i32 32)
  %127 = add nsw <4 x i32> %124, %126
  call void @__trace_edge(i32 20, i32 13)
  %128 = sdiv <4 x i32> %127, <i32 2, i32 2, i32 2, i32 2>
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 13)
  %129 = getelementptr inbounds i32, ptr %8, i64 %115
  call void @__trace_edge(i32 32, i32 34)
  %130 = load <4 x i32>, ptr %129, align 4, !tbaa !5
  call void @__trace_edge(i32 15, i32 20)
  call void @__trace_edge(i32 15, i32 32)
  %131 = sub nsw <4 x i32> %128, %130
  call void @__trace_edge(i32 17, i32 15)
  %132 = mul nsw <4 x i32> %131, <i32 998, i32 998, i32 998, i32 998>
  call void @__trace_edge(i32 20, i32 17)
  %133 = sdiv <4 x i32> %132, <i32 1000, i32 1000, i32 1000, i32 1000>
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 13)
  %134 = getelementptr inbounds i32, ptr %5, i64 %115
  call void @__trace_edge(i32 33, i32 20)
  call void @__trace_edge(i32 33, i32 34)
  store <4 x i32> %133, ptr %134, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 55)
  %135 = add nuw i64 %113, 4
  call void @__trace_edge(i32 53, i32 13)
  %136 = icmp eq i64 %135, 380
  call void @__trace_edge(i32 2, i32 53)
  br i1 %136, label %137, label %112, !llvm.loop !28

137:                                              ; preds = %112
  call void @__trace_edge(i32 13, i32 17)
  %138 = add nuw nsw i64 %111, 381
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 13)
  %139 = getelementptr i32, ptr %7, i64 %138
  call void @__trace_edge(i32 34, i32 34)
  %140 = getelementptr i32, ptr %139, i64 -1
  call void @__trace_edge(i32 32, i32 34)
  %141 = load i32, ptr %140, align 4, !tbaa !5
  call void @__trace_edge(i32 34, i32 34)
  %142 = getelementptr i32, ptr %139, i64 1
  call void @__trace_edge(i32 32, i32 34)
  %143 = load i32, ptr %142, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 32)
  call void @__trace_edge(i32 13, i32 32)
  %144 = add nsw i32 %143, %141
  call void @__trace_edge(i32 34, i32 34)
  %145 = getelementptr i32, ptr %139, i64 -384
  call void @__trace_edge(i32 32, i32 34)
  %146 = load i32, ptr %145, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 13)
  call void @__trace_edge(i32 13, i32 32)
  %147 = add nsw i32 %144, %146
  call void @__trace_edge(i32 34, i32 34)
  %148 = getelementptr i32, ptr %139, i64 384
  call void @__trace_edge(i32 32, i32 34)
  %149 = load i32, ptr %148, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 13)
  call void @__trace_edge(i32 13, i32 32)
  %150 = add nsw i32 %147, %149
  call void @__trace_edge(i32 20, i32 13)
  %151 = sdiv i32 %150, 2
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 13)
  %152 = getelementptr inbounds i32, ptr %8, i64 %138
  call void @__trace_edge(i32 32, i32 34)
  %153 = load i32, ptr %152, align 4, !tbaa !5
  call void @__trace_edge(i32 15, i32 20)
  call void @__trace_edge(i32 15, i32 32)
  %154 = sub nsw i32 %151, %153
  call void @__trace_edge(i32 17, i32 15)
  %155 = mul nsw i32 %154, 998
  call void @__trace_edge(i32 20, i32 17)
  %156 = sdiv i32 %155, 1000
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 13)
  %157 = getelementptr inbounds i32, ptr %5, i64 %138
  call void @__trace_edge(i32 33, i32 20)
  call void @__trace_edge(i32 33, i32 34)
  store i32 %156, ptr %157, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 17)
  %158 = add nuw nsw i64 %111, 382
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 13)
  %159 = getelementptr i32, ptr %7, i64 %158
  call void @__trace_edge(i32 34, i32 34)
  %160 = getelementptr i32, ptr %159, i64 -1
  call void @__trace_edge(i32 32, i32 34)
  %161 = load i32, ptr %160, align 4, !tbaa !5
  call void @__trace_edge(i32 34, i32 34)
  %162 = getelementptr i32, ptr %159, i64 1
  call void @__trace_edge(i32 32, i32 34)
  %163 = load i32, ptr %162, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 32)
  call void @__trace_edge(i32 13, i32 32)
  %164 = add nsw i32 %163, %161
  call void @__trace_edge(i32 34, i32 34)
  %165 = getelementptr i32, ptr %159, i64 -384
  call void @__trace_edge(i32 32, i32 34)
  %166 = load i32, ptr %165, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 13)
  call void @__trace_edge(i32 13, i32 32)
  %167 = add nsw i32 %164, %166
  call void @__trace_edge(i32 34, i32 34)
  %168 = getelementptr i32, ptr %159, i64 384
  call void @__trace_edge(i32 32, i32 34)
  %169 = load i32, ptr %168, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 13)
  call void @__trace_edge(i32 13, i32 32)
  %170 = add nsw i32 %167, %169
  call void @__trace_edge(i32 20, i32 13)
  %171 = sdiv i32 %170, 2
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 13)
  %172 = getelementptr inbounds i32, ptr %8, i64 %158
  call void @__trace_edge(i32 32, i32 34)
  %173 = load i32, ptr %172, align 4, !tbaa !5
  call void @__trace_edge(i32 15, i32 20)
  call void @__trace_edge(i32 15, i32 32)
  %174 = sub nsw i32 %171, %173
  call void @__trace_edge(i32 17, i32 15)
  %175 = mul nsw i32 %174, 998
  call void @__trace_edge(i32 20, i32 17)
  %176 = sdiv i32 %175, 1000
  call void @__trace_edge(i32 34, i32 55)
  call void @__trace_edge(i32 34, i32 13)
  %177 = getelementptr inbounds i32, ptr %5, i64 %158
  call void @__trace_edge(i32 33, i32 20)
  call void @__trace_edge(i32 33, i32 34)
  store i32 %176, ptr %177, align 4, !tbaa !5
  call void @__trace_edge(i32 13, i32 55)
  %178 = add nuw nsw i64 %110, 1
  call void @__trace_edge(i32 53, i32 13)
  %179 = icmp eq i64 %178, 191
  call void @__trace_edge(i32 2, i32 53)
  br i1 %179, label %180, label %109, !llvm.loop !27

180:                                              ; preds = %137
  call void @__trace_edge(i32 13, i32 55)
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

declare void @__trace_edge(i32, i32)

declare void @__trace_register_opcode(i32, ptr)

declare void @__trace_after_flush()

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
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
