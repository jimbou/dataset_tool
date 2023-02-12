; ModuleID = 'ip_inst.bc'
source_filename = "ip.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [13 x i8] c"hello world\0A\00", align 1
@.str.1 = private unnamed_addr constant [69 x i8] c"/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"rapl_beg_end.txt\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"%llu\0A\00", align 1
@.str.6 = private unnamed_addr constant [44 x i8] c"Enter IP Address (xxx.xxx.xxx.xxx format): \00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.8 = private unnamed_addr constant [37 x i8] c"\0AIp Address: %03d. %03d. %03d. %03d\0A\00", align 1
@.str.9 = private unnamed_addr constant [21 x i8] c"Class A Ip Address.\0A\00", align 1
@.str.10 = private unnamed_addr constant [21 x i8] c"Class B Ip Address.\0A\00", align 1
@.str.11 = private unnamed_addr constant [21 x i8] c"Class C Ip Address.\0A\00", align 1
@.str.12 = private unnamed_addr constant [21 x i8] c"Class D Ip Address.\0A\00", align 1
@.str.13 = private unnamed_addr constant [21 x i8] c"Class E Ip Address.\0A\00", align 1
@.str.14 = private unnamed_addr constant [14 x i8] c"rapl_rest.txt\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @hello() #0 {
hello:
  call void @rapl_A()
  call void @rapl_B()
  %0 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0))
  call void @rapl_C()
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @do_nothing() #0 {
do_nothing:
  call void @rapl_A()
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rapl_D() #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  store i8* null, i8** %1, align 8
  store i64 0, i64* %2, align 8
  %7 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %5, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #6
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #6
  unreachable

16:                                               ; preds = %12
  br label %17

17:                                               ; preds = %21, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %19 = call i64 @getline(i8** %1, i64* %2, %struct._IO_FILE* %18)
  store i64 %19, i64* %3, align 8
  %20 = icmp ne i64 %19, -1
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  br label %17

22:                                               ; preds = %17
  %23 = load i8*, i8** %1, align 8
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #7
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #7
  br label %29

29:                                               ; preds = %27, %22
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %33 = load i64, i64* %4, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0), i64 %33)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %36 = call i32 @fclose(%struct._IO_FILE* %35)
  ret void
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

declare dso_local i64 @getline(i8**, i64*, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare dso_local i64 @strtoull(i8*, i8**, i32) #3

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

declare dso_local i32 @fclose(%struct._IO_FILE*) #1

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @extractIpAddress(i8* %0, i16* %1) #0 {
extractIpAddress:
  call void @rapl_A()
  %2 = alloca i8*, align 8
  %3 = alloca i16*, align 8
  %4 = alloca i16, align 2
  %5 = alloca [4 x i8], align 1
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  %9 = alloca [5 x i8], align 1
  store i8* %0, i8** %2, align 8
  store i16* %1, i16** %3, align 8
  store i16 0, i16* %4, align 2
  %10 = bitcast [4 x i8]* %5 to i8*
  call void @rapl_B()
  call void @llvm.memset.p0i8.i64(i8* align 1 %10, i8 0, i64 4, i1 false)
  call void @rapl_C()
  store i8 0, i8* %6, align 1
  store i8 0, i8* %7, align 1
  %11 = load i8*, i8** %2, align 8
  call void @rapl_B()
  %12 = call i64 @strlen(i8* %11) #8
  call void @rapl_C()
  %13 = trunc i64 %12 to i16
  store i16 %13, i16* %4, align 2
  store i8 0, i8* %8, align 1
  br label %extractIpAddress1

extractIpAddress1:                                ; preds = %extractIpAddress8, %extractIpAddress
  call void @rapl_A()
  %14 = load i8, i8* %8, align 1
  %15 = zext i8 %14 to i32
  %16 = load i16, i16* %4, align 2
  %17 = zext i16 %16 to i32
  %18 = icmp slt i32 %15, %17
  br i1 %18, label %extractIpAddress2, label %extractIpAddress9

extractIpAddress2:                                ; preds = %extractIpAddress1
  call void @rapl_A()
  %19 = load i8*, i8** %2, align 8
  %20 = load i8, i8* %8, align 1
  %21 = zext i8 %20 to i64
  %22 = getelementptr inbounds i8, i8* %19, i64 %21
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = icmp ne i32 %24, 46
  br i1 %25, label %extractIpAddress3, label %extractIpAddress4

extractIpAddress3:                                ; preds = %extractIpAddress2
  call void @rapl_A()
  %26 = load i8*, i8** %2, align 8
  %27 = load i8, i8* %8, align 1
  %28 = zext i8 %27 to i64
  %29 = getelementptr inbounds i8, i8* %26, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = load i8, i8* %6, align 1
  %32 = add i8 %31, 1
  store i8 %32, i8* %6, align 1
  %33 = zext i8 %31 to i64
  %34 = getelementptr inbounds [5 x i8], [5 x i8]* %9, i64 0, i64 %33
  store i8 %30, i8* %34, align 1
  br label %extractIpAddress4

extractIpAddress4:                                ; preds = %extractIpAddress3, %extractIpAddress2
  call void @rapl_A()
  %35 = load i8*, i8** %2, align 8
  %36 = load i8, i8* %8, align 1
  %37 = zext i8 %36 to i64
  %38 = getelementptr inbounds i8, i8* %35, i64 %37
  %39 = load i8, i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = icmp eq i32 %40, 46
  br i1 %41, label %extractIpAddress6, label %extractIpAddress5

extractIpAddress5:                                ; preds = %extractIpAddress4
  call void @rapl_A()
  %42 = load i8, i8* %8, align 1
  %43 = zext i8 %42 to i32
  %44 = load i16, i16* %4, align 2
  %45 = zext i16 %44 to i32
  %46 = sub nsw i32 %45, 1
  %47 = icmp eq i32 %43, %46
  br i1 %47, label %extractIpAddress6, label %extractIpAddress7

extractIpAddress6:                                ; preds = %extractIpAddress5, %extractIpAddress4
  call void @rapl_A()
  %48 = load i8, i8* %6, align 1
  %49 = zext i8 %48 to i64
  %50 = getelementptr inbounds [5 x i8], [5 x i8]* %9, i64 0, i64 %49
  store i8 0, i8* %50, align 1
  store i8 0, i8* %6, align 1
  %51 = getelementptr inbounds [5 x i8], [5 x i8]* %9, i64 0, i64 0
  call void @rapl_B()
  %52 = call i32 @atoi(i8* %51) #8
  call void @rapl_C()
  %53 = trunc i32 %52 to i8
  %54 = load i8, i8* %7, align 1
  %55 = add i8 %54, 1
  store i8 %55, i8* %7, align 1
  %56 = zext i8 %54 to i64
  %57 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 %56
  store i8 %53, i8* %57, align 1
  br label %extractIpAddress7

extractIpAddress7:                                ; preds = %extractIpAddress6, %extractIpAddress5
  call void @rapl_A()
  br label %extractIpAddress8

extractIpAddress8:                                ; preds = %extractIpAddress7
  call void @rapl_A()
  %58 = load i8, i8* %8, align 1
  %59 = add i8 %58, 1
  store i8 %59, i8* %8, align 1
  br label %extractIpAddress1

extractIpAddress9:                                ; preds = %extractIpAddress1
  call void @rapl_A()
  %60 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 0
  %61 = load i8, i8* %60, align 1
  %62 = zext i8 %61 to i16
  %63 = load i16*, i16** %3, align 8
  %64 = getelementptr inbounds i16, i16* %63, i64 0
  store i16 %62, i16* %64, align 2
  %65 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 1
  %66 = load i8, i8* %65, align 1
  %67 = zext i8 %66 to i16
  %68 = load i16*, i16** %3, align 8
  %69 = getelementptr inbounds i16, i16* %68, i64 1
  store i16 %67, i16* %69, align 2
  %70 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 2
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i16
  %73 = load i16*, i16** %3, align 8
  %74 = getelementptr inbounds i16, i16* %73, i64 2
  store i16 %72, i16* %74, align 2
  %75 = getelementptr inbounds [4 x i8], [4 x i8]* %5, i64 0, i64 3
  %76 = load i8, i8* %75, align 1
  %77 = zext i8 %76 to i16
  %78 = load i16*, i16** %3, align 8
  %79 = getelementptr inbounds i16, i16* %78, i64 3
  store i16 %77, i16* %79, align 2
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
main:
  call void @rapl_A()
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca [20 x i8], align 16
  %7 = alloca [4 x i16], align 2
  store i32 0, i32* %2, align 4
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  call void @rapl_B()
  call void @do_nothing()
  call void @rapl_C()
  store i32 1, i32* %5, align 4
  br label %main1

main1:                                            ; preds = %main17, %main
  call void @rapl_A()
  %8 = load i32, i32* %5, align 4
  %9 = icmp slt i32 %8, 30
  br i1 %9, label %main2, label %main18

main2:                                            ; preds = %main1
  call void @rapl_A()
  %10 = bitcast [20 x i8]* %6 to i8*
  call void @rapl_B()
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 20, i1 false)
  call void @rapl_C()
  call void @rapl_B()
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.6, i64 0, i64 0))
  call void @rapl_C()
  %12 = load i8**, i8*** %4, align 8
  %13 = load i32, i32* %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i8*, i8** %12, i64 %14
  %16 = load i8*, i8** %15, align 8
  %17 = getelementptr inbounds [20 x i8], [20 x i8]* %6, i64 0, i64 0
  call void @rapl_B()
  %18 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %16, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* %17) #7
  call void @rapl_C()
  %19 = getelementptr inbounds [20 x i8], [20 x i8]* %6, i64 0, i64 0
  %20 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 0
  call void @rapl_B()
  call void @extractIpAddress(i8* %19, i16* %20)
  call void @rapl_C()
  %21 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 0
  %22 = load i16, i16* %21, align 2
  %23 = sext i16 %22 to i32
  %24 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 1
  %25 = load i16, i16* %24, align 2
  %26 = sext i16 %25 to i32
  %27 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 2
  %28 = load i16, i16* %27, align 2
  %29 = sext i16 %28 to i32
  %30 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 3
  %31 = load i16, i16* %30, align 2
  %32 = sext i16 %31 to i32
  call void @rapl_B()
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.8, i64 0, i64 0), i32 %23, i32 %26, i32 %29, i32 %32)
  call void @rapl_C()
  %34 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 0
  %35 = load i16, i16* %34, align 2
  %36 = sext i16 %35 to i32
  %37 = icmp sge i32 %36, 0
  br i1 %37, label %main3, label %main5

main3:                                            ; preds = %main2
  call void @rapl_A()
  %38 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 0
  %39 = load i16, i16* %38, align 2
  %40 = sext i16 %39 to i32
  %41 = icmp sle i32 %40, 127
  br i1 %41, label %main4, label %main5

main4:                                            ; preds = %main3
  call void @rapl_A()
  call void @rapl_B()
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.9, i64 0, i64 0))
  call void @rapl_C()
  br label %main5

main5:                                            ; preds = %main4, %main3, %main2
  call void @rapl_A()
  %43 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 0
  %44 = load i16, i16* %43, align 2
  %45 = sext i16 %44 to i32
  %46 = icmp sgt i32 %45, 127
  br i1 %46, label %main6, label %main8

main6:                                            ; preds = %main5
  call void @rapl_A()
  %47 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 0
  %48 = load i16, i16* %47, align 2
  %49 = sext i16 %48 to i32
  %50 = icmp slt i32 %49, 191
  br i1 %50, label %main7, label %main8

main7:                                            ; preds = %main6
  call void @rapl_A()
  call void @rapl_B()
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i64 0, i64 0))
  call void @rapl_C()
  br label %main8

main8:                                            ; preds = %main7, %main6, %main5
  call void @rapl_A()
  %52 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 0
  %53 = load i16, i16* %52, align 2
  %54 = sext i16 %53 to i32
  %55 = icmp sgt i32 %54, 191
  br i1 %55, label %main9, label %main11

main9:                                            ; preds = %main8
  call void @rapl_A()
  %56 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 0
  %57 = load i16, i16* %56, align 2
  %58 = sext i16 %57 to i32
  %59 = icmp slt i32 %58, 224
  br i1 %59, label %main10, label %main11

main10:                                           ; preds = %main9
  call void @rapl_A()
  call void @rapl_B()
  %60 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.11, i64 0, i64 0))
  call void @rapl_C()
  br label %main11

main11:                                           ; preds = %main10, %main9, %main8
  call void @rapl_A()
  %61 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 0
  %62 = load i16, i16* %61, align 2
  %63 = sext i16 %62 to i32
  %64 = icmp sgt i32 %63, 224
  br i1 %64, label %main12, label %main14

main12:                                           ; preds = %main11
  call void @rapl_A()
  %65 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 0
  %66 = load i16, i16* %65, align 2
  %67 = sext i16 %66 to i32
  %68 = icmp sle i32 %67, 239
  br i1 %68, label %main13, label %main14

main13:                                           ; preds = %main12
  call void @rapl_A()
  call void @rapl_B()
  %69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.12, i64 0, i64 0))
  call void @rapl_C()
  br label %main14

main14:                                           ; preds = %main13, %main12, %main11
  call void @rapl_A()
  %70 = getelementptr inbounds [4 x i16], [4 x i16]* %7, i64 0, i64 0
  %71 = load i16, i16* %70, align 2
  %72 = sext i16 %71 to i32
  %73 = icmp sgt i32 %72, 239
  br i1 %73, label %main15, label %main16

main15:                                           ; preds = %main14
  call void @rapl_A()
  call void @rapl_B()
  %74 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.13, i64 0, i64 0))
  call void @rapl_C()
  br label %main16

main16:                                           ; preds = %main15, %main14
  call void @rapl_A()
  br label %main17

main17:                                           ; preds = %main16
  call void @rapl_A()
  %75 = load i32, i32* %5, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %5, align 4
  br label %main1

main18:                                           ; preds = %main1
  call void @rapl_A()
  call void @rapl_B()
  call void @do_nothing()
  call void @rapl_C()
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local i32 @__isoc99_sscanf(i8*, i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rapl_A() #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  store i8* null, i8** %1, align 8
  store i64 0, i64* %2, align 8
  %7 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %5, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #6
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #6
  unreachable

16:                                               ; preds = %12
  br label %17

17:                                               ; preds = %21, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %19 = call i64 @getline(i8** %1, i64* %2, %struct._IO_FILE* %18)
  store i64 %19, i64* %3, align 8
  %20 = icmp ne i64 %19, -1
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  br label %17

22:                                               ; preds = %17
  %23 = load i8*, i8** %1, align 8
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #7
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #7
  br label %29

29:                                               ; preds = %27, %22
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %33 = load i64, i64* %4, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0), i64 %33)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %36 = call i32 @fclose(%struct._IO_FILE* %35)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rapl_B() #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  store i8* null, i8** %1, align 8
  store i64 0, i64* %2, align 8
  %7 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %5, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #6
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #6
  unreachable

16:                                               ; preds = %12
  br label %17

17:                                               ; preds = %21, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %19 = call i64 @getline(i8** %1, i64* %2, %struct._IO_FILE* %18)
  store i64 %19, i64* %3, align 8
  %20 = icmp ne i64 %19, -1
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  br label %17

22:                                               ; preds = %17
  %23 = load i8*, i8** %1, align 8
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #7
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #7
  br label %29

29:                                               ; preds = %27, %22
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %33 = load i64, i64* %4, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0), i64 %33)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %36 = call i32 @fclose(%struct._IO_FILE* %35)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @rapl_C() #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  store i8* null, i8** %1, align 8
  store i64 0, i64* %2, align 8
  %7 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %5, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #6
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #6
  unreachable

16:                                               ; preds = %12
  br label %17

17:                                               ; preds = %21, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %19 = call i64 @getline(i8** %1, i64* %2, %struct._IO_FILE* %18)
  store i64 %19, i64* %3, align 8
  %20 = icmp ne i64 %19, -1
  br i1 %20, label %21, label %22

21:                                               ; preds = %17
  br label %17

22:                                               ; preds = %17
  %23 = load i8*, i8** %1, align 8
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #7
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #7
  br label %29

29:                                               ; preds = %27, %22
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %33 = load i64, i64* %4, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0), i64 %33)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %36 = call i32 @fclose(%struct._IO_FILE* %35)
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 "}
