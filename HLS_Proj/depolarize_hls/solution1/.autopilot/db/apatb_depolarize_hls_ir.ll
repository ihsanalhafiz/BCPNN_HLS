; ModuleID = '/home/miahafiz/BCPNN_HLS/HLS_Proj/depolarize_hls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_depolarize_hls_ir(float* noalias nocapture nonnull "maxi" %d_bwsup, float* noalias nocapture nonnull readonly "maxi" %d_Wij, float* noalias nocapture nonnull readonly "maxi" %d_Xi, i32 %Ni, i32 %Nj, float %alpha, float %beta, float* noalias nocapture nonnull readonly "maxi" %d_Bj, float %biasmul) local_unnamed_addr #0 {
entry:
  %d_bwsup_copy = alloca [1000 x float], align 512
  %malloccall = tail call i8* @malloc(i64 4000000)
  %d_Wij_copy = bitcast i8* %malloccall to [1000000 x float]*
  %d_Xi_copy = alloca [1000 x float], align 512
  %d_Bj_copy = alloca [1000 x float], align 512
  %0 = bitcast float* %d_bwsup to [1000 x float]*
  %1 = bitcast float* %d_Wij to [1000000 x float]*
  %2 = bitcast float* %d_Xi to [1000 x float]*
  %3 = bitcast float* %d_Bj to [1000 x float]*
  call fastcc void @copy_in([1000 x float]* nonnull %0, [1000 x float]* nonnull align 512 %d_bwsup_copy, [1000000 x float]* nonnull %1, [1000000 x float]* %d_Wij_copy, [1000 x float]* nonnull %2, [1000 x float]* nonnull align 512 %d_Xi_copy, [1000 x float]* nonnull %3, [1000 x float]* nonnull align 512 %d_Bj_copy)
  call void @apatb_depolarize_hls_hw([1000 x float]* %d_bwsup_copy, [1000000 x float]* %d_Wij_copy, [1000 x float]* %d_Xi_copy, i32 %Ni, i32 %Nj, float %alpha, float %beta, [1000 x float]* %d_Bj_copy, float %biasmul)
  call void @copy_back([1000 x float]* %0, [1000 x float]* %d_bwsup_copy, [1000000 x float]* %1, [1000000 x float]* %d_Wij_copy, [1000 x float]* %2, [1000 x float]* %d_Xi_copy, [1000 x float]* %3, [1000 x float]* %d_Bj_copy)
  tail call void @free(i8* %malloccall)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([1000 x float]* noalias readonly, [1000 x float]* noalias align 512, [1000000 x float]* noalias readonly, [1000000 x float]* noalias, [1000 x float]* noalias readonly, [1000 x float]* noalias align 512, [1000 x float]* noalias readonly, [1000 x float]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1000f32([1000 x float]* align 512 %1, [1000 x float]* %0)
  call fastcc void @onebyonecpy_hls.p0a1000000f32([1000000 x float]* %3, [1000000 x float]* %2)
  call fastcc void @onebyonecpy_hls.p0a1000f32([1000 x float]* align 512 %5, [1000 x float]* %4)
  call fastcc void @onebyonecpy_hls.p0a1000f32([1000 x float]* align 512 %7, [1000 x float]* %6)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a1000f32([1000 x float]* noalias align 512 %dst, [1000 x float]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [1000 x float]* %dst, null
  %1 = icmp eq [1000 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a1000f32([1000 x float]* nonnull %dst, [1000 x float]* nonnull %src, i64 1000)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1000f32([1000 x float]* %dst, [1000 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [1000 x float]* %src, null
  %1 = icmp eq [1000 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1000 x float], [1000 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1000 x float], [1000 x float]* %src, i64 0, i64 %for.loop.idx2
  %3 = load float, float* %src.addr, align 4
  store float %3, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a1000000f32([1000000 x float]* noalias %dst, [1000000 x float]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [1000000 x float]* %dst, null
  %1 = icmp eq [1000000 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a1000000f32([1000000 x float]* nonnull %dst, [1000000 x float]* nonnull %src, i64 1000000)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1000000f32([1000000 x float]* %dst, [1000000 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [1000000 x float]* %src, null
  %1 = icmp eq [1000000 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1000000 x float], [1000000 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1000000 x float], [1000000 x float]* %src, i64 0, i64 %for.loop.idx2
  %3 = load float, float* %src.addr, align 4
  store float %3, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([1000 x float]* noalias, [1000 x float]* noalias readonly align 512, [1000000 x float]* noalias, [1000000 x float]* noalias readonly, [1000 x float]* noalias, [1000 x float]* noalias readonly align 512, [1000 x float]* noalias, [1000 x float]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1000f32([1000 x float]* %0, [1000 x float]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a1000000f32([1000000 x float]* %2, [1000000 x float]* %3)
  call fastcc void @onebyonecpy_hls.p0a1000f32([1000 x float]* %4, [1000 x float]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a1000f32([1000 x float]* %6, [1000 x float]* align 512 %7)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_depolarize_hls_hw([1000 x float]*, [1000000 x float]*, [1000 x float]*, i32, i32, float, float, [1000 x float]*, float)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([1000 x float]* noalias, [1000 x float]* noalias readonly align 512, [1000000 x float]* noalias, [1000000 x float]* noalias readonly, [1000 x float]* noalias, [1000 x float]* noalias readonly align 512, [1000 x float]* noalias, [1000 x float]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1000f32([1000 x float]* %0, [1000 x float]* align 512 %1)
  ret void
}

define void @depolarize_hls_hw_stub_wrapper([1000 x float]*, [1000000 x float]*, [1000 x float]*, i32, i32, float, float, [1000 x float]*, float) #5 {
entry:
  call void @copy_out([1000 x float]* null, [1000 x float]* %0, [1000000 x float]* null, [1000000 x float]* %1, [1000 x float]* null, [1000 x float]* %2, [1000 x float]* null, [1000 x float]* %7)
  %9 = bitcast [1000 x float]* %0 to float*
  %10 = bitcast [1000000 x float]* %1 to float*
  %11 = bitcast [1000 x float]* %2 to float*
  %12 = bitcast [1000 x float]* %7 to float*
  call void @depolarize_hls_hw_stub(float* %9, float* %10, float* %11, i32 %3, i32 %4, float %5, float %6, float* %12, float %8)
  call void @copy_in([1000 x float]* null, [1000 x float]* %0, [1000000 x float]* null, [1000000 x float]* %1, [1000 x float]* null, [1000 x float]* %2, [1000 x float]* null, [1000 x float]* %7)
  ret void
}

declare void @depolarize_hls_hw_stub(float*, float*, float*, i32, i32, float, float, float*, float)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
