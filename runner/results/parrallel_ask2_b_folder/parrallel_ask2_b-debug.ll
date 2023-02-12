; ModuleID = 'parrallel_ask2_b_inst.bc'
source_filename = "parrallel_ask2_b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.timeval = type { i64, i64 }

@.str = private unnamed_addr constant [69 x i8] c"/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"rapl_beg_end.txt\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"%llu\0A\00", align 1
@stdout = external dso_local global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [13 x i8] c"Usage: %s N\0A\00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"FW,%d,%.4f\0A\00", align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"rapl_rest.txt\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @min(i32 %0, i32 %1) #0 {
min:
  call void @rapl_A()
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %3, align 4
  %6 = load i32, i32* %4, align 4
  %7 = icmp sle i32 %5, %6
  br i1 %7, label %min1, label %min2

min1:                                             ; preds = %min
  call void @rapl_A()
  %8 = load i32, i32* %3, align 4
  store i32 %8, i32* %2, align 4
  br label %min3

min2:                                             ; preds = %min
  call void @rapl_A()
  %9 = load i32, i32* %4, align 4
  store i32 %9, i32* %2, align 4
  br label %min3

min3:                                             ; preds = %min2, %min1
  call void @rapl_A()
  %10 = load i32, i32* %2, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @graph_init_random(i32** %0, i32 %1, i32 %2, i32 %3) #0 {
graph_init_random:
  call void @rapl_A()
  %4 = alloca i32**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32** %0, i32*** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  store i32 %3, i32* %7, align 4
  %10 = load i32, i32* %5, align 4
  %11 = sext i32 %10 to i64
  call void @rapl_B()
  call void @srand48(i64 %11) #6
  call void @rapl_C()
  store i32 0, i32* %8, align 4
  br label %graph_init_random1

graph_init_random1:                               ; preds = %graph_init_random7, %graph_init_random
  call void @rapl_A()
  %12 = load i32, i32* %8, align 4
  %13 = load i32, i32* %6, align 4
  %14 = icmp ult i32 %12, %13
  br i1 %14, label %graph_init_random2, label %graph_init_random8

graph_init_random2:                               ; preds = %graph_init_random1
  call void @rapl_A()
  store i32 0, i32* %9, align 4
  br label %graph_init_random3

graph_init_random3:                               ; preds = %graph_init_random5, %graph_init_random2
  call void @rapl_A()
  %15 = load i32, i32* %9, align 4
  %16 = load i32, i32* %6, align 4
  %17 = icmp ult i32 %15, %16
  br i1 %17, label %graph_init_random4, label %graph_init_random6

graph_init_random4:                               ; preds = %graph_init_random3
  call void @rapl_A()
  call void @rapl_B()
  %18 = call i64 @lrand48() #6
  call void @rapl_C()
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 1048576
  call void @rapl_B()
  %21 = call i32 @abs(i32 %20) #7
  call void @rapl_C()
  %22 = load i32**, i32*** %4, align 8
  %23 = load i32, i32* %8, align 4
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i32*, i32** %22, i64 %24
  %26 = load i32*, i32** %25, align 8
  %27 = load i32, i32* %9, align 4
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i32, i32* %26, i64 %28
  store i32 %21, i32* %29, align 4
  br label %graph_init_random5

graph_init_random5:                               ; preds = %graph_init_random4
  call void @rapl_A()
  %30 = load i32, i32* %9, align 4
  %31 = add i32 %30, 1
  store i32 %31, i32* %9, align 4
  br label %graph_init_random3

graph_init_random6:                               ; preds = %graph_init_random3
  call void @rapl_A()
  br label %graph_init_random7

graph_init_random7:                               ; preds = %graph_init_random6
  call void @rapl_A()
  %32 = load i32, i32* %8, align 4
  %33 = add i32 %32, 1
  store i32 %33, i32* %8, align 4
  br label %graph_init_random1

graph_init_random8:                               ; preds = %graph_init_random1
  call void @rapl_A()
  store i32 0, i32* %8, align 4
  br label %graph_init_random9

graph_init_random9:                               ; preds = %graph_init_random11, %graph_init_random8
  call void @rapl_A()
  %34 = load i32, i32* %8, align 4
  %35 = load i32, i32* %6, align 4
  %36 = icmp ult i32 %34, %35
  br i1 %36, label %graph_init_random10, label %graph_init_random12

graph_init_random10:                              ; preds = %graph_init_random9
  call void @rapl_A()
  %37 = load i32**, i32*** %4, align 8
  %38 = load i32, i32* %8, align 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds i32*, i32** %37, i64 %39
  %41 = load i32*, i32** %40, align 8
  %42 = load i32, i32* %8, align 4
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32* %41, i64 %43
  store i32 0, i32* %44, align 4
  br label %graph_init_random11

graph_init_random11:                              ; preds = %graph_init_random10
  call void @rapl_A()
  %45 = load i32, i32* %8, align 4
  %46 = add i32 %45, 1
  store i32 %46, i32* %8, align 4
  br label %graph_init_random9

graph_init_random12:                              ; preds = %graph_init_random9
  call void @rapl_A()
  ret void
}

; Function Attrs: nounwind
declare dso_local void @srand48(i64) #1

; Function Attrs: nounwind readnone
declare dso_local i32 @abs(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @lrand48() #1

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
  %7 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %5, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #8
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #8
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
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #6
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #6
  br label %29

29:                                               ; preds = %27, %22
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %33 = load i64, i64* %4, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), i64 %33)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %36 = call i32 @fclose(%struct._IO_FILE* %35)
  ret void
}

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

declare dso_local i64 @getline(i8**, i64*, %struct._IO_FILE*) #3

; Function Attrs: nounwind
declare dso_local i64 @strtoull(i8*, i8**, i32) #1

; Function Attrs: nounwind
declare dso_local void @free(i8*) #1

declare dso_local i32 @fclose(%struct._IO_FILE*) #3

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @do_nothing() #0 {
do_nothing:
  call void @rapl_A()
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
main:
  call void @rapl_A()
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.timeval, align 8
  %10 = alloca %struct.timeval, align 8
  %11 = alloca double, align 8
  %12 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  call void @rapl_B()
  call void @do_nothing()
  call void @rapl_C()
  store i32 1024, i32* %12, align 4
  %13 = load i32, i32* %3, align 4
  %14 = icmp ne i32 %13, 2
  br i1 %14, label %main1, label %main2

main1:                                            ; preds = %main
  call void @rapl_A()
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  %16 = load i8**, i8*** %4, align 8
  %17 = getelementptr inbounds i8*, i8** %16, i64 0
  %18 = load i8*, i8** %17, align 8
  call void @rapl_B()
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.5, i64 0, i64 0), i8* %18)
  call void @rapl_C()
  call void @rapl_B()
  call void @exit(i32 0) #8
  call void @rapl_C()
  unreachable

main2:                                            ; preds = %main
  call void @rapl_A()
  %20 = load i8**, i8*** %4, align 8
  %21 = getelementptr inbounds i8*, i8** %20, i64 1
  %22 = load i8*, i8** %21, align 8
  call void @rapl_B()
  %23 = call i32 @atoi(i8* %22) #9
  call void @rapl_C()
  store i32 %23, i32* %12, align 4
  %24 = load i32, i32* %12, align 4
  %25 = sext i32 %24 to i64
  %26 = mul i64 %25, 8
  call void @rapl_B()
  %27 = call noalias i8* @malloc(i64 %26) #6
  call void @rapl_C()
  %28 = bitcast i8* %27 to i32**
  store i32** %28, i32*** %5, align 8
  store i32 0, i32* %6, align 4
  br label %main3

main3:                                            ; preds = %main5, %main2
  call void @rapl_A()
  %29 = load i32, i32* %6, align 4
  %30 = load i32, i32* %12, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %main4, label %main6

main4:                                            ; preds = %main3
  call void @rapl_A()
  %32 = load i32, i32* %12, align 4
  %33 = sext i32 %32 to i64
  %34 = mul i64 %33, 4
  call void @rapl_B()
  %35 = call noalias i8* @malloc(i64 %34) #6
  call void @rapl_C()
  %36 = bitcast i8* %35 to i32*
  %37 = load i32**, i32*** %5, align 8
  %38 = load i32, i32* %6, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32*, i32** %37, i64 %39
  store i32* %36, i32** %40, align 8
  br label %main5

main5:                                            ; preds = %main4
  call void @rapl_A()
  %41 = load i32, i32* %6, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %6, align 4
  br label %main3

main6:                                            ; preds = %main3
  call void @rapl_A()
  %43 = load i32**, i32*** %5, align 8
  %44 = load i32, i32* %12, align 4
  %45 = load i32, i32* %12, align 4
  %46 = mul nsw i32 128, %45
  call void @rapl_B()
  call void @graph_init_random(i32** %43, i32 -1, i32 %44, i32 %46)
  call void @rapl_C()
  call void @rapl_B()
  %47 = call i32 @gettimeofday(%struct.timeval* %9, i8* null) #6
  call void @rapl_C()
  store i32 0, i32* %8, align 4
  br label %main7

main7:                                            ; preds = %main17, %main6
  call void @rapl_A()
  %48 = load i32, i32* %8, align 4
  %49 = load i32, i32* %12, align 4
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %main8, label %main18

main8:                                            ; preds = %main7
  call void @rapl_A()
  store i32 0, i32* %6, align 4
  br label %main9

main9:                                            ; preds = %main15, %main8
  call void @rapl_A()
  %51 = load i32, i32* %6, align 4
  %52 = load i32, i32* %12, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %main10, label %main16

main10:                                           ; preds = %main9
  call void @rapl_A()
  store i32 0, i32* %7, align 4
  br label %main11

main11:                                           ; preds = %main13, %main10
  call void @rapl_A()
  %54 = load i32, i32* %7, align 4
  %55 = load i32, i32* %12, align 4
  %56 = icmp slt i32 %54, %55
  br i1 %56, label %main12, label %main14

main12:                                           ; preds = %main11
  call void @rapl_A()
  %57 = load i32**, i32*** %5, align 8
  %58 = load i32, i32* %6, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32*, i32** %57, i64 %59
  %61 = load i32*, i32** %60, align 8
  %62 = load i32, i32* %7, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32* %61, i64 %63
  %65 = load i32, i32* %64, align 4
  %66 = load i32**, i32*** %5, align 8
  %67 = load i32, i32* %6, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32*, i32** %66, i64 %68
  %70 = load i32*, i32** %69, align 8
  %71 = load i32, i32* %8, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, i32* %70, i64 %72
  %74 = load i32, i32* %73, align 4
  %75 = load i32**, i32*** %5, align 8
  %76 = load i32, i32* %8, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32*, i32** %75, i64 %77
  %79 = load i32*, i32** %78, align 8
  %80 = load i32, i32* %7, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32, i32* %79, i64 %81
  %83 = load i32, i32* %82, align 4
  %84 = add nsw i32 %74, %83
  call void @rapl_B()
  %85 = call i32 @min(i32 %65, i32 %84)
  call void @rapl_C()
  %86 = load i32**, i32*** %5, align 8
  %87 = load i32, i32* %6, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i32*, i32** %86, i64 %88
  %90 = load i32*, i32** %89, align 8
  %91 = load i32, i32* %7, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32* %90, i64 %92
  store i32 %85, i32* %93, align 4
  br label %main13

main13:                                           ; preds = %main12
  call void @rapl_A()
  %94 = load i32, i32* %7, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %7, align 4
  br label %main11

main14:                                           ; preds = %main11
  call void @rapl_A()
  br label %main15

main15:                                           ; preds = %main14
  call void @rapl_A()
  %96 = load i32, i32* %6, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %6, align 4
  br label %main9

main16:                                           ; preds = %main9
  call void @rapl_A()
  br label %main17

main17:                                           ; preds = %main16
  call void @rapl_A()
  %98 = load i32, i32* %8, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %8, align 4
  br label %main7

main18:                                           ; preds = %main7
  call void @rapl_A()
  call void @rapl_B()
  %100 = call i32 @gettimeofday(%struct.timeval* %10, i8* null) #6
  call void @rapl_C()
  %101 = getelementptr inbounds %struct.timeval, %struct.timeval* %10, i32 0, i32 0
  %102 = load i64, i64* %101, align 8
  %103 = getelementptr inbounds %struct.timeval, %struct.timeval* %9, i32 0, i32 0
  %104 = load i64, i64* %103, align 8
  %105 = sub nsw i64 %102, %104
  %106 = mul nsw i64 %105, 1000000
  %107 = getelementptr inbounds %struct.timeval, %struct.timeval* %10, i32 0, i32 1
  %108 = load i64, i64* %107, align 8
  %109 = add nsw i64 %106, %108
  %110 = getelementptr inbounds %struct.timeval, %struct.timeval* %9, i32 0, i32 1
  %111 = load i64, i64* %110, align 8
  %112 = sub nsw i64 %109, %111
  %113 = sitofp i64 %112 to double
  %114 = fdiv double %113, 1.000000e+06
  store double %114, double* %11, align 8
  %115 = load i32, i32* %12, align 4
  %116 = load double, double* %11, align 8
  call void @rapl_B()
  %117 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i64 0, i64 0), i32 %115, double %116)
  call void @rapl_C()
  call void @rapl_B()
  call void @do_nothing()
  call void @rapl_C()
  ret i32 0
}

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #5

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval*, i8*) #1

declare dso_local i32 @printf(i8*, ...) #3

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
  %7 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %5, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #8
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #8
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
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #6
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #6
  br label %29

29:                                               ; preds = %27, %22
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %33 = load i64, i64* %4, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), i64 %33)
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
  %7 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %5, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #8
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #8
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
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #6
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #6
  br label %29

29:                                               ; preds = %27, %22
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %33 = load i64, i64* %4, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), i64 %33)
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
  %7 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %5, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #8
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #8
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
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #6
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #6
  br label %29

29:                                               ; preds = %27, %22
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %31 = call i32 @fclose(%struct._IO_FILE* %30)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %33 = load i64, i64* %4, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), i64 %33)
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %36 = call i32 @fclose(%struct._IO_FILE* %35)
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readnone }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 "}
