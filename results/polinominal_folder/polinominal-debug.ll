; ModuleID = 'polinominal_inst.bc'
source_filename = "polinominal.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [69 x i8] c"/sys/class/powercap/intel-rapl/intel-rapl:0/intel-rapl:0:0/energy_uj\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"rapl_beg_end.txt\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"%llu\0A\00", align 1
@.str.5 = private unnamed_addr constant [42 x i8] c"Enter the degree of polynomial equation: \00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.7 = private unnamed_addr constant [65 x i8] c"Ehter the value of x for which the equation is to be evaluated: \00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%LF\00", align 1
@.str.9 = private unnamed_addr constant [45 x i8] c"Enter the coefficient of x to the power %d: \00", align 1
@.str.10 = private unnamed_addr constant [66 x i8] c"The value of polynomial equation for the value of x = %LF is: %LF\00", align 1
@.str.11 = private unnamed_addr constant [14 x i8] c"rapl_rest.txt\00", align 1

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
  call void @exit(i32 1) #4
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #4
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
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #5
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #5
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
  %5 = alloca x86_fp80, align 16
  %6 = alloca [30 x x86_fp80], align 16
  %7 = alloca x86_fp80, align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 0, i32* %2, align 4
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  call void @rapl_B()
  call void @do_nothing()
  call void @rapl_C()
  call void @rapl_B()
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.5, i64 0, i64 0))
  call void @rapl_C()
  %11 = load i8**, i8*** %4, align 8
  %12 = getelementptr inbounds i8*, i8** %11, i64 1
  %13 = load i8*, i8** %12, align 8
  call void @rapl_B()
  %14 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %13, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i64 0, i64 0), i32* %8) #5
  call void @rapl_C()
  call void @rapl_B()
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str.7, i64 0, i64 0))
  call void @rapl_C()
  %16 = load i8**, i8*** %4, align 8
  %17 = getelementptr inbounds i8*, i8** %16, i64 2
  %18 = load i8*, i8** %17, align 8
  call void @rapl_B()
  %19 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %18, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), x86_fp80* %5) #5
  call void @rapl_C()
  store i32 0, i32* %9, align 4
  br label %main1

main1:                                            ; preds = %main3, %main
  call void @rapl_A()
  %20 = load i32, i32* %9, align 4
  %21 = load i32, i32* %8, align 4
  %22 = icmp sle i32 %20, %21
  br i1 %22, label %main2, label %main4

main2:                                            ; preds = %main1
  call void @rapl_A()
  %23 = load i32, i32* %9, align 4
  call void @rapl_B()
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.9, i64 0, i64 0), i32 %23)
  call void @rapl_C()
  %25 = load i8**, i8*** %4, align 8
  %26 = load i32, i32* %9, align 4
  %27 = add nsw i32 %26, 3
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8*, i8** %25, i64 %28
  %30 = load i8*, i8** %29, align 8
  %31 = load i32, i32* %9, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [30 x x86_fp80], [30 x x86_fp80]* %6, i64 0, i64 %32
  call void @rapl_B()
  %34 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %30, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), x86_fp80* %33) #5
  call void @rapl_C()
  br label %main3

main3:                                            ; preds = %main2
  call void @rapl_A()
  %35 = load i32, i32* %9, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %9, align 4
  br label %main1

main4:                                            ; preds = %main1
  call void @rapl_A()
  %37 = getelementptr inbounds [30 x x86_fp80], [30 x x86_fp80]* %6, i64 0, i64 0
  %38 = load i32, i32* %8, align 4
  %39 = load x86_fp80, x86_fp80* %5, align 16
  call void @rapl_B()
  %40 = call float @poly(x86_fp80* %37, i32 %38, x86_fp80 %39)
  call void @rapl_C()
  %41 = fpext float %40 to x86_fp80
  store x86_fp80 %41, x86_fp80* %7, align 16
  %42 = load x86_fp80, x86_fp80* %5, align 16
  %43 = load x86_fp80, x86_fp80* %7, align 16
  call void @rapl_B()
  %44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str.10, i64 0, i64 0), x86_fp80 %42, x86_fp80 %43)
  call void @rapl_C()
  call void @rapl_B()
  call void @do_nothing()
  call void @rapl_C()
  ret i32 0
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare dso_local i32 @__isoc99_sscanf(i8*, i8*, ...) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @poly(x86_fp80* %0, i32 %1, x86_fp80 %2) #0 {
poly:
  call void @rapl_A()
  %3 = alloca x86_fp80*, align 8
  %4 = alloca i32, align 4
  %5 = alloca x86_fp80, align 16
  %6 = alloca x86_fp80, align 16
  %7 = alloca i32, align 4
  store x86_fp80* %0, x86_fp80** %3, align 8
  store i32 %1, i32* %4, align 4
  store x86_fp80 %2, x86_fp80* %5, align 16
  %8 = load x86_fp80*, x86_fp80** %3, align 8
  %9 = load i32, i32* %4, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds x86_fp80, x86_fp80* %8, i64 %10
  %12 = load x86_fp80, x86_fp80* %11, align 16
  store x86_fp80 %12, x86_fp80* %6, align 16
  %13 = load i32, i32* %4, align 4
  store i32 %13, i32* %7, align 4
  br label %poly1

poly1:                                            ; preds = %poly3, %poly
  call void @rapl_A()
  %14 = load i32, i32* %7, align 4
  %15 = icmp sge i32 %14, 1
  br i1 %15, label %poly2, label %poly4

poly2:                                            ; preds = %poly1
  call void @rapl_A()
  %16 = load x86_fp80*, x86_fp80** %3, align 8
  %17 = load i32, i32* %7, align 4
  %18 = sub nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds x86_fp80, x86_fp80* %16, i64 %19
  %21 = load x86_fp80, x86_fp80* %20, align 16
  %22 = load x86_fp80, x86_fp80* %5, align 16
  %23 = load x86_fp80, x86_fp80* %6, align 16
  %24 = fmul x86_fp80 %22, %23
  %25 = fadd x86_fp80 %21, %24
  store x86_fp80 %25, x86_fp80* %6, align 16
  br label %poly3

poly3:                                            ; preds = %poly2
  call void @rapl_A()
  %26 = load i32, i32* %7, align 4
  %27 = add nsw i32 %26, -1
  store i32 %27, i32* %7, align 4
  br label %poly1

poly4:                                            ; preds = %poly1
  call void @rapl_A()
  %28 = load x86_fp80, x86_fp80* %6, align 16
  %29 = fptrunc x86_fp80 %28 to float
  ret float %29
}

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
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #4
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #4
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
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #5
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #5
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
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #4
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #4
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
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #5
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #5
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
  %8 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %0
  call void @exit(i32 1) #4
  unreachable

12:                                               ; preds = %0
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %14 = icmp eq %struct._IO_FILE* %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  call void @exit(i32 1) #4
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
  %24 = call i64 @strtoull(i8* %23, i8** null, i32 10) #5
  store i64 %24, i64* %4, align 8
  %25 = load i8*, i8** %1, align 8
  %26 = icmp ne i8* %25, null
  br i1 %26, label %27, label %29

27:                                               ; preds = %22
  %28 = load i8*, i8** %1, align 8
  call void @free(i8* %28) #5
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
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 "}
