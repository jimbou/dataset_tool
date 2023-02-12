; ModuleID = 'ip.c'
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
  %1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0))
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @do_nothing() #0 {
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
  %3 = alloca i8*, align 8
  %4 = alloca i16*, align 8
  %5 = alloca i16, align 2
  %6 = alloca [4 x i8], align 1
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  %9 = alloca i8, align 1
  %10 = alloca [5 x i8], align 1
  store i8* %0, i8** %3, align 8
  store i16* %1, i16** %4, align 8
  store i16 0, i16* %5, align 2
  %11 = bitcast [4 x i8]* %6 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 1 %11, i8 0, i64 4, i1 false)
  store i8 0, i8* %7, align 1
  store i8 0, i8* %8, align 1
  %12 = load i8*, i8** %3, align 8
  %13 = call i64 @strlen(i8* %12) #8
  %14 = trunc i64 %13 to i16
  store i16 %14, i16* %5, align 2
  store i8 0, i8* %9, align 1
  br label %15

15:                                               ; preds = %66, %2
  %16 = load i8, i8* %9, align 1
  %17 = zext i8 %16 to i32
  %18 = load i16, i16* %5, align 2
  %19 = zext i16 %18 to i32
  %20 = icmp slt i32 %17, %19
  br i1 %20, label %21, label %69

21:                                               ; preds = %15
  %22 = load i8*, i8** %3, align 8
  %23 = load i8, i8* %9, align 1
  %24 = zext i8 %23 to i64
  %25 = getelementptr inbounds i8, i8* %22, i64 %24
  %26 = load i8, i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp ne i32 %27, 46
  br i1 %28, label %29, label %39

29:                                               ; preds = %21
  %30 = load i8*, i8** %3, align 8
  %31 = load i8, i8* %9, align 1
  %32 = zext i8 %31 to i64
  %33 = getelementptr inbounds i8, i8* %30, i64 %32
  %34 = load i8, i8* %33, align 1
  %35 = load i8, i8* %7, align 1
  %36 = add i8 %35, 1
  store i8 %36, i8* %7, align 1
  %37 = zext i8 %35 to i64
  %38 = getelementptr inbounds [5 x i8], [5 x i8]* %10, i64 0, i64 %37
  store i8 %34, i8* %38, align 1
  br label %39

39:                                               ; preds = %29, %21
  %40 = load i8*, i8** %3, align 8
  %41 = load i8, i8* %9, align 1
  %42 = zext i8 %41 to i64
  %43 = getelementptr inbounds i8, i8* %40, i64 %42
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = icmp eq i32 %45, 46
  br i1 %46, label %54, label %47

47:                                               ; preds = %39
  %48 = load i8, i8* %9, align 1
  %49 = zext i8 %48 to i32
  %50 = load i16, i16* %5, align 2
  %51 = zext i16 %50 to i32
  %52 = sub nsw i32 %51, 1
  %53 = icmp eq i32 %49, %52
  br i1 %53, label %54, label %65

54:                                               ; preds = %47, %39
  %55 = load i8, i8* %7, align 1
  %56 = zext i8 %55 to i64
  %57 = getelementptr inbounds [5 x i8], [5 x i8]* %10, i64 0, i64 %56
  store i8 0, i8* %57, align 1
  store i8 0, i8* %7, align 1
  %58 = getelementptr inbounds [5 x i8], [5 x i8]* %10, i64 0, i64 0
  %59 = call i32 @atoi(i8* %58) #8
  %60 = trunc i32 %59 to i8
  %61 = load i8, i8* %8, align 1
  %62 = add i8 %61, 1
  store i8 %62, i8* %8, align 1
  %63 = zext i8 %61 to i64
  %64 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 %63
  store i8 %60, i8* %64, align 1
  br label %65

65:                                               ; preds = %54, %47
  br label %66

66:                                               ; preds = %65
  %67 = load i8, i8* %9, align 1
  %68 = add i8 %67, 1
  store i8 %68, i8* %9, align 1
  br label %15

69:                                               ; preds = %15
  %70 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 0
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i16
  %73 = load i16*, i16** %4, align 8
  %74 = getelementptr inbounds i16, i16* %73, i64 0
  store i16 %72, i16* %74, align 2
  %75 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 1
  %76 = load i8, i8* %75, align 1
  %77 = zext i8 %76 to i16
  %78 = load i16*, i16** %4, align 8
  %79 = getelementptr inbounds i16, i16* %78, i64 1
  store i16 %77, i16* %79, align 2
  %80 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 2
  %81 = load i8, i8* %80, align 1
  %82 = zext i8 %81 to i16
  %83 = load i16*, i16** %4, align 8
  %84 = getelementptr inbounds i16, i16* %83, i64 2
  store i16 %82, i16* %84, align 2
  %85 = getelementptr inbounds [4 x i8], [4 x i8]* %6, i64 0, i64 3
  %86 = load i8, i8* %85, align 1
  %87 = zext i8 %86 to i16
  %88 = load i16*, i16** %4, align 8
  %89 = getelementptr inbounds i16, i16* %88, i64 3
  store i16 %87, i16* %89, align 2
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
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca [20 x i8], align 16
  %8 = alloca [4 x i16], align 2
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  call void @do_nothing()
  store i32 1, i32* %6, align 4
  br label %9

9:                                                ; preds = %92, %2
  %10 = load i32, i32* %6, align 4
  %11 = icmp slt i32 %10, 30
  br i1 %11, label %12, label %95

12:                                               ; preds = %9
  %13 = bitcast [20 x i8]* %7 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 16 %13, i8 0, i64 20, i1 false)
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.6, i64 0, i64 0))
  %15 = load i8**, i8*** %5, align 8
  %16 = load i32, i32* %6, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8*, i8** %15, i64 %17
  %19 = load i8*, i8** %18, align 8
  %20 = getelementptr inbounds [20 x i8], [20 x i8]* %7, i64 0, i64 0
  %21 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %19, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i8* %20) #7
  %22 = getelementptr inbounds [20 x i8], [20 x i8]* %7, i64 0, i64 0
  %23 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 0
  call void @extractIpAddress(i8* %22, i16* %23)
  %24 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 0
  %25 = load i16, i16* %24, align 2
  %26 = sext i16 %25 to i32
  %27 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 1
  %28 = load i16, i16* %27, align 2
  %29 = sext i16 %28 to i32
  %30 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 2
  %31 = load i16, i16* %30, align 2
  %32 = sext i16 %31 to i32
  %33 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 3
  %34 = load i16, i16* %33, align 2
  %35 = sext i16 %34 to i32
  %36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.8, i64 0, i64 0), i32 %26, i32 %29, i32 %32, i32 %35)
  %37 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 0
  %38 = load i16, i16* %37, align 2
  %39 = sext i16 %38 to i32
  %40 = icmp sge i32 %39, 0
  br i1 %40, label %41, label %48

41:                                               ; preds = %12
  %42 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 0
  %43 = load i16, i16* %42, align 2
  %44 = sext i16 %43 to i32
  %45 = icmp sle i32 %44, 127
  br i1 %45, label %46, label %48

46:                                               ; preds = %41
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.9, i64 0, i64 0))
  br label %48

48:                                               ; preds = %46, %41, %12
  %49 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 0
  %50 = load i16, i16* %49, align 2
  %51 = sext i16 %50 to i32
  %52 = icmp sgt i32 %51, 127
  br i1 %52, label %53, label %60

53:                                               ; preds = %48
  %54 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 0
  %55 = load i16, i16* %54, align 2
  %56 = sext i16 %55 to i32
  %57 = icmp slt i32 %56, 191
  br i1 %57, label %58, label %60

58:                                               ; preds = %53
  %59 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i64 0, i64 0))
  br label %60

60:                                               ; preds = %58, %53, %48
  %61 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 0
  %62 = load i16, i16* %61, align 2
  %63 = sext i16 %62 to i32
  %64 = icmp sgt i32 %63, 191
  br i1 %64, label %65, label %72

65:                                               ; preds = %60
  %66 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 0
  %67 = load i16, i16* %66, align 2
  %68 = sext i16 %67 to i32
  %69 = icmp slt i32 %68, 224
  br i1 %69, label %70, label %72

70:                                               ; preds = %65
  %71 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.11, i64 0, i64 0))
  br label %72

72:                                               ; preds = %70, %65, %60
  %73 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 0
  %74 = load i16, i16* %73, align 2
  %75 = sext i16 %74 to i32
  %76 = icmp sgt i32 %75, 224
  br i1 %76, label %77, label %84

77:                                               ; preds = %72
  %78 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 0
  %79 = load i16, i16* %78, align 2
  %80 = sext i16 %79 to i32
  %81 = icmp sle i32 %80, 239
  br i1 %81, label %82, label %84

82:                                               ; preds = %77
  %83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.12, i64 0, i64 0))
  br label %84

84:                                               ; preds = %82, %77, %72
  %85 = getelementptr inbounds [4 x i16], [4 x i16]* %8, i64 0, i64 0
  %86 = load i16, i16* %85, align 2
  %87 = sext i16 %86 to i32
  %88 = icmp sgt i32 %87, 239
  br i1 %88, label %89, label %91

89:                                               ; preds = %84
  %90 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.13, i64 0, i64 0))
  br label %91

91:                                               ; preds = %89, %84
  br label %92

92:                                               ; preds = %91
  %93 = load i32, i32* %6, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %6, align 4
  br label %9

95:                                               ; preds = %9
  call void @do_nothing()
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
